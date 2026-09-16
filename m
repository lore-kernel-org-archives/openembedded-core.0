Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4175C982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:44:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8416.1789537495123832101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J+aobAPN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bBhPwgQZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0a8bf2485-7fcc913b-46eb-4433-90e8-9347981ba858-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789537494;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9G8ZKPTunUidrHtoOyN+l6BOj62D5UMk6r43RDwH/Vk=;
	b=J+aobAPNGAFs5yC++/Ago8LTS+91UpOUdgJbAliV2SbOfdRWU/wiMDGE+mdymDCc
	+1mOyDUdVXZBM1XrRfG3E6KMwIEhK+OEtTsRPReh/gs8osHqEc2+N20kK0+rBFJjPEk
	WtyY5sNPngXHtznCnpO4mIf5uuOxvRic0reU+xSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789537494;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9G8ZKPTunUidrHtoOyN+l6BOj62D5UMk6r43RDwH/Vk=;
	b=bBhPwgQZYytsgkhPhq8dwyMzia+rxylqg9I66hHIlh0fOho5GSqTmnKSQW2EzvSk
	BrZSzHmp1fvSqvkIj5TZznxs9YYaxQtj0gno963aBKQcX1SNIEhtTiJ3KaBwo6S/r7i
	GtOM2+mJlqScJxvIpjR3GEf46NDfDgtYzGjvqtyU=
Content-Type: multipart/mixed; boundary="===============0634875104592377271=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.8.0 SUCCEEDED
Message-ID: <010101a0a8bf2485-7fcc913b-46eb-4433-90e8-9347981ba858-000000@us-west-2.amazonses.com>
Date: Wed, 16 Sep 2026 05:44:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245919

--===============0634875104592377271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.7.0-2.8.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 4048ca87d1bb1dbd0e37e15ff770cda24c87322c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Sep 2026 05:39:03 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.7.0 -> 2.8.0

Source: CHANGES.rst

2.8.0 (2026-09-15)
==================

Security
--------

Fixed the following security issues:

- The TLS configuration for HTTPS proxies could be ignored or overridden.
  (High severity, `GHSA-8988-9cw3-xx77 <https://github.com/urllib3/urllib3/security/advisories/GHSA-8988-9cw3-xx77>`__)
- ``HTTPResponse.stream()`` and ``read_chunked()`` could buffer a chunk-size
  line of unbounded length in memory. (High severity,
  `GHSA-vxq7-64xx-v4gw <https://github.com/urllib3/urllib3/security/advisories/GHSA-vxq7-64xx-v4gw>`__)
- Chunked Deflate streaming could enter an infinite loop. (Medium severity,
  `GHSA-gh4c-6fx4-qh6g <https://github.com/urllib3/urllib3/security/advisories/GHSA-gh4c-6fx4-qh6g>`__)

.. caution::

    urllib3 2.8.0 fixes HTTPS proxy TLS configuration being ignored or
    overridden by destination settings. Configurations relying on that
    behavior may require changes.

    Configure proxy CA certificates and client certificates in
    ``proxy_ssl_context``, and proxy identity checks with
    ``proxy_assert_hostname`` or ``proxy_assert_fingerprint``.
    Destination client certificates and identity overrides no longer
    apply to HTTPS forwarding proxy connections.

Deprecations & Removals
-----------------------

- Deprecated using an empty collection as the ``Retry`` option
  ``allowed_methods`` to retry any verb.
  (`#5044 <https://github.com/urllib3/urllib3/issues/5044>`__)

Features
--------

- Added ``Url.auth_decoded`` and ``Url.auth_decoded_joined`` convenience
  properties to the result of ``parse_url()``.
  (`#4945 <https://github.com/urllib3/urllib3/issues/4945>`__)
- Added ``basic_auth_encoding`` and ``proxy_basic_auth_encoding`` parameters to
  ``urllib3.util.make_headers()``.
  (`#5092 <https://github.com/urllib3/urllib3/issues/5092>`__)

Bugfixes
--------

- Fixed response header handling to replace obsolete folded header lines
  (`obs-fold`) with spaces in accordance with RFC 9112, preventing raw CRLF
  sequences from appearing in header values such as ``Set-Cookie``.
  (`#1362 <https://github.com/urllib3/urllib3/issues/1362>`__)
- Fixed usage of ``proxy_ssl_context`` with ``ProxyManager`` when
  ``use_forwarding_for_https=True``. Passing ``ssl_context`` instead of
  ``proxy_ssl_context`` for HTTPS proxies in this configuration now emits a
  ``FutureWarning`` and will raise an error in v3.0.
  (`#2577 <https://github.com/urllib3/urllib3/issues/2577>`__)
- Changed behavior of the default ``ConnectionPool.pool`` initialization.
  ``LifoQueue`` is now resolved from the ``queue`` module after the
  ``ConnectionPool`` is instantiated instead of using the default cached
  ``QueueCls`` class property. This is done because sometimes the
  ``queue.LifoQueue`` is monkey-patched late in the program, such as by gevent.
  (`#3289 <https://github.com/urllib3/urllib3/issues/3289>`__)
- Raised ``UnrewindableBodyError`` instead of ``ValueError`` when retrying a
  request whose body had ``tell()`` but not ``seek(

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{python3-urllib3_2.7.0.bb => python3-urllib3_2.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.7.0.bb => python3-urllib3_2.8.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.8.0.bb
index 9e73a49bca..4aafe2d63d 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
+SRC_URI[sha256sum] = "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============0634875104592377271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-urllib3-changelog.txt"

Changelog for python3-urllib3: 2.7.0 -> 2.8.0
Source: CHANGES.rst

2.8.0 (2026-09-15)
==================

Security
--------

Fixed the following security issues:

- The TLS configuration for HTTPS proxies could be ignored or overridden.
  (High severity, `GHSA-8988-9cw3-xx77 <https://github.com/urllib3/urllib3/security/advisories/GHSA-8988-9cw3-xx77>`__)
- ``HTTPResponse.stream()`` and ``read_chunked()`` could buffer a chunk-size
  line of unbounded length in memory. (High severity,
  `GHSA-vxq7-64xx-v4gw <https://github.com/urllib3/urllib3/security/advisories/GHSA-vxq7-64xx-v4gw>`__)
- Chunked Deflate streaming could enter an infinite loop. (Medium severity,
  `GHSA-gh4c-6fx4-qh6g <https://github.com/urllib3/urllib3/security/advisories/GHSA-gh4c-6fx4-qh6g>`__)

.. caution::

    urllib3 2.8.0 fixes HTTPS proxy TLS configuration being ignored or
    overridden by destination settings. Configurations relying on that
    behavior may require changes.

    Configure proxy CA certificates and client certificates in
    ``proxy_ssl_context``, and proxy identity checks with
    ``proxy_assert_hostname`` or ``proxy_assert_fingerprint``.
    Destination client certificates and identity overrides no longer
    apply to HTTPS forwarding proxy connections.

Deprecations & Removals
-----------------------

- Deprecated using an empty collection as the ``Retry`` option
  ``allowed_methods`` to retry any verb.
  (`#5044 <https://github.com/urllib3/urllib3/issues/5044>`__)

Features
--------

- Added ``Url.auth_decoded`` and ``Url.auth_decoded_joined`` convenience
  properties to the result of ``parse_url()``.
  (`#4945 <https://github.com/urllib3/urllib3/issues/4945>`__)
- Added ``basic_auth_encoding`` and ``proxy_basic_auth_encoding`` parameters to
  ``urllib3.util.make_headers()``.
  (`#5092 <https://github.com/urllib3/urllib3/issues/5092>`__)

Bugfixes
--------

- Fixed response header handling to replace obsolete folded header lines
  (`obs-fold`) with spaces in accordance with RFC 9112, preventing raw CRLF
  sequences from appearing in header values such as ``Set-Cookie``.
  (`#1362 <https://github.com/urllib3/urllib3/issues/1362>`__)
- Fixed usage of ``proxy_ssl_context`` with ``ProxyManager`` when
  ``use_forwarding_for_https=True``. Passing ``ssl_context`` instead of
  ``proxy_ssl_context`` for HTTPS proxies in this configuration now emits a
  ``FutureWarning`` and will raise an error in v3.0.
  (`#2577 <https://github.com/urllib3/urllib3/issues/2577>`__)
- Changed behavior of the default ``ConnectionPool.pool`` initialization.
  ``LifoQueue`` is now resolved from the ``queue`` module after the
  ``ConnectionPool`` is instantiated instead of using the default cached
  ``QueueCls`` class property. This is done because sometimes the
  ``queue.LifoQueue`` is monkey-patched late in the program, such as by gevent.
  (`#3289 <https://github.com/urllib3/urllib3/issues/3289>`__)
- Raised ``UnrewindableBodyError`` instead of ``ValueError`` when retrying a
  request whose body had ``tell()`` but not ``seek()``.
  (`#3779 <https://github.com/urllib3/urllib3/issues/3779>`__)
- Decoded percent-encoded SOCKS proxy credentials before authenticating with
  the proxy server.
  (`#3785 <https://github.com/urllib3/urllib3/issues/3785>`__)
- Fixed ``HTTPResponse.drain_conn()`` to discard unread response data in 64 KiB
  chunks (same as the default ``amt`` when doing ``HTTPResponse.stream(...)``).
  (`#5019 <https://github.com/urllib3/urllib3/issues/5019>`__)
- Fixed ``is_ipaddress()`` to detect non-standard IPv4 forms accepted by
  ``socket.connect``, such as hex (``0x7f000001``), octal (``0177.0.0.1``), and
  decimal integers (``2130706433``), ensuring SSL certificate verification uses
  the correct mode for these addresses.
  (`#5029 <https://github.com/urllib3/urllib3/issues/5029>`__)
- Fixed ``HTTPConnectionPool.urlopen`` raising a misleading ``FullPoolError``
  instead of ``ValueError`` when called with an invalid ``timeout`` argument on
  a pool created with ``block=True``.
  (`#5059 <https://github.com/urllib3/urllib3/issues/5059>`__)
- Fixed port-zero handling to preserve explicit ``:0`` values instead of
  substituting the default ports 80 or 443 in URL parsing, pool selection,
  proxy configuration, ``connection_from_url()``, and HTTP/2 request authority.
  (`#5071 <https://github.com/urllib3/urllib3/issues/5071>`__,
  `#5101 <https://github.com/urllib3/urllib3/issues/5101>`__)
- Fixed a bug where ``PoolManager`` passed the ``assert_hostname`` and
  ``assert_fingerprint`` parameters to HTTP connection pools.
  (`#5077 <https://github.com/urllib3/urllib3/issues/5077>`__)
- Fixed ``HTTPConnectionPool.urlopen()`` and HTTP proxy forwarding to strip URL
  fragments from absolute request targets before sending requests.
  (`#5079 <https://github.com/urllib3/urllib3/issues/5079>`__)
- Added safeguards to the proxy tunneling code to prevent potential security
  issues when handling invalid characters in the proxy host and HTTP headers.
  This change affects users of Python 3.10, Python 3.11, and Python 3.12 when
  the standard library does not contain the fix; those on newer Python versions
  should upgrade to 3.13.14+ or 3.14.5+ to get the same security fixes.
  (`#5091 <https://github.com/urllib3/urllib3/issues/5091>`__)
- Fixed ``HTTPSConnection.connect()`` overriding ``ProxyConfig.ssl_context``'s
  certificate policy and proxy identity checks with the target connection's TLS
  settings when forwarding through an HTTPS proxy.

  ``HTTPSConnection`` no longer applies target SNI, assertions, or client
  credentials to forwarding proxy handshakes and continues to use its
  ``ssl_context`` as a fallback when an HTTPS proxy forwards an HTTP target.
  (`#5093 <https://github.com/urllib3/urllib3/issues/5093>`__)
- Fixed URL parsing to more strictly enforce RFC 3986 host syntax, rejecting
  invalid host input such as raw spaces and control characters, malformed
  percent-encodings, and percent-encoded control characters in HTTP(S) hosts
  and IPv6 zone identifiers, including proxy CONNECT tunnel targets. Host
  normalization now also follows RFC 3986 normalization rules for
  percent-encoded octets by decoding percent-encoded unreserved characters and
  uppercasing the hexadecimal digits of retained percent-encoded octets.
  (`#5095 <https://github.com/urllib3/urllib3/issues/5095>`__)
- Fixed an ``AttributeError`` on Python built with OpenSSL 4+, where
  ``ssl.PROTOCOL_TLSv1`` no longer exists.
  (`#5097 <https://github.com/urllib3/urllib3/issues/5097>`__)
- Fixed ``urllib3.contrib.pyopenssl`` to use cryptography APIs when reading a
  certificate subject and loading encrypted private keys, avoiding
  ``DeprecationWarning`` raised by pyOpenSSL 26.3.0+.
  (`#5103 <https://github.com/urllib3/urllib3/issues/5103>`__)
- Fixed handling of HTTP 303 redirects for requests with chunked or file-like
  bodies.
  (`#5161 <https://github.com/urllib3/urllib3/issues/5161>`__)
- Fixed ``assert_fingerprint()`` to raise ``SSLError`` instead of
  ``binascii.Error`` when a fingerprint has a supported length but contains
  non-hexadecimal characters.
  (`#5211 <https://github.com/urllib3/urllib3/issues/5211>`__)

Misc
----

- Added a ``test`` dependency group containing the minimum dependencies needed
  to run the test suite, intended for downstream packagers. The ``dev-base``
  and ``mypy`` groups now include this new group via ``include-group``,
  removing duplication.
  (`#3594 <https://github.com/urllib3/urllib3/issues/3594>`__)
- Fixed test failures with pytest >= 9.1.
  (`#5094 <https://github.com/urllib3/urllib3/issues/5094>`__)
- Enabled JSPI tests with Firefox in the Emscripten test suite.
  (`#5166 <https://github.com/urllib3/urllib3/issues/5166>`__)
- Improved streamed response decoding performance.
  (`#5209 <https://github.com/urllib3/urllib3/issues/5209>`__)
- Fixed flaky tests.
  (`#5232 <https://github.com/urllib3/urllib3/issues/5232>`__,
  `#5234 <https://github.com/urllib3/urllib3/issues/5234>`__,
  `#5239 <https://github.com/urllib3/urllib3/issues/5239>`__)

  (`#3763 <https://github.com/urllib3/urllib3/issues/3763>`__)

--===============0634875104592377271==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.7.0-2.8.0.patch"

RnJvbSA0MDQ4Y2E4N2QxYmIxZGJkMGUzN2UxNWZmNzcwY2RhMjRjODczMjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgU2VwIDIwMjYgMDU6Mzk6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi43LjAgLT4gMi44LjAKClNvdXJjZTogQ0hBTkdFUy5y
c3QKCjIuOC4wICgyMDI2LTA5LTE1KQo9PT09PT09PT09PT09PT09PT0KClNlY3VyaXR5Ci0tLS0t
LS0tCgpGaXhlZCB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKCi0gVGhlIFRMUyBjb25m
aWd1cmF0aW9uIGZvciBIVFRQUyBwcm94aWVzIGNvdWxkIGJlIGlnbm9yZWQgb3Igb3ZlcnJpZGRl
bi4KICAoSGlnaCBzZXZlcml0eSwgYEdIU0EtODk4OC05Y3czLXh4NzcgPGh0dHBzOi8vZ2l0aHVi
LmNvbS91cmxsaWIzL3VybGxpYjMvc2VjdXJpdHkvYWR2aXNvcmllcy9HSFNBLTg5ODgtOWN3My14
eDc3PmBfXykKLSBgYEhUVFBSZXNwb25zZS5zdHJlYW0oKWBgIGFuZCBgYHJlYWRfY2h1bmtlZCgp
YGAgY291bGQgYnVmZmVyIGEgY2h1bmstc2l6ZQogIGxpbmUgb2YgdW5ib3VuZGVkIGxlbmd0aCBp
biBtZW1vcnkuIChIaWdoIHNldmVyaXR5LAogIGBHSFNBLXZ4cTctNjR4eC12NGd3IDxodHRwczov
L2dpdGh1Yi5jb20vdXJsbGliMy91cmxsaWIzL3NlY3VyaXR5L2Fkdmlzb3JpZXMvR0hTQS12eHE3
LTY0eHgtdjRndz5gX18pCi0gQ2h1bmtlZCBEZWZsYXRlIHN0cmVhbWluZyBjb3VsZCBlbnRlciBh
biBpbmZpbml0ZSBsb29wLiAoTWVkaXVtIHNldmVyaXR5LAogIGBHSFNBLWdoNGMtNmZ4NC1xaDZn
IDxodHRwczovL2dpdGh1Yi5jb20vdXJsbGliMy91cmxsaWIzL3NlY3VyaXR5L2Fkdmlzb3JpZXMv
R0hTQS1naDRjLTZmeDQtcWg2Zz5gX18pCgouLiBjYXV0aW9uOjoKCiAgICB1cmxsaWIzIDIuOC4w
IGZpeGVzIEhUVFBTIHByb3h5IFRMUyBjb25maWd1cmF0aW9uIGJlaW5nIGlnbm9yZWQgb3IKICAg
IG92ZXJyaWRkZW4gYnkgZGVzdGluYXRpb24gc2V0dGluZ3MuIENvbmZpZ3VyYXRpb25zIHJlbHlp
bmcgb24gdGhhdAogICAgYmVoYXZpb3IgbWF5IHJlcXVpcmUgY2hhbmdlcy4KCiAgICBDb25maWd1
cmUgcHJveHkgQ0EgY2VydGlmaWNhdGVzIGFuZCBjbGllbnQgY2VydGlmaWNhdGVzIGluCiAgICBg
YHByb3h5X3NzbF9jb250ZXh0YGAsIGFuZCBwcm94eSBpZGVudGl0eSBjaGVja3Mgd2l0aAogICAg
YGBwcm94eV9hc3NlcnRfaG9zdG5hbWVgYCBvciBgYHByb3h5X2Fzc2VydF9maW5nZXJwcmludGBg
LgogICAgRGVzdGluYXRpb24gY2xpZW50IGNlcnRpZmljYXRlcyBhbmQgaWRlbnRpdHkgb3ZlcnJp
ZGVzIG5vIGxvbmdlcgogICAgYXBwbHkgdG8gSFRUUFMgZm9yd2FyZGluZyBwcm94eSBjb25uZWN0
aW9ucy4KCkRlcHJlY2F0aW9ucyAmIFJlbW92YWxzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgot
IERlcHJlY2F0ZWQgdXNpbmcgYW4gZW1wdHkgY29sbGVjdGlvbiBhcyB0aGUgYGBSZXRyeWBgIG9w
dGlvbgogIGBgYWxsb3dlZF9tZXRob2RzYGAgdG8gcmV0cnkgYW55IHZlcmIuCiAgKGAjNTA0NCA8
aHR0cHM6Ly9naXRodWIuY29tL3VybGxpYjMvdXJsbGliMy9pc3N1ZXMvNTA0ND5gX18pCgpGZWF0
dXJlcwotLS0tLS0tLQoKLSBBZGRlZCBgYFVybC5hdXRoX2RlY29kZWRgYCBhbmQgYGBVcmwuYXV0
aF9kZWNvZGVkX2pvaW5lZGBgIGNvbnZlbmllbmNlCiAgcHJvcGVydGllcyB0byB0aGUgcmVzdWx0
IG9mIGBgcGFyc2VfdXJsKClgYC4KICAoYCM0OTQ1IDxodHRwczovL2dpdGh1Yi5jb20vdXJsbGli
My91cmxsaWIzL2lzc3Vlcy80OTQ1PmBfXykKLSBBZGRlZCBgYGJhc2ljX2F1dGhfZW5jb2Rpbmdg
YCBhbmQgYGBwcm94eV9iYXNpY19hdXRoX2VuY29kaW5nYGAgcGFyYW1ldGVycyB0bwogIGBgdXJs
bGliMy51dGlsLm1ha2VfaGVhZGVycygpYGAuCiAgKGAjNTA5MiA8aHR0cHM6Ly9naXRodWIuY29t
L3VybGxpYjMvdXJsbGliMy9pc3N1ZXMvNTA5Mj5gX18pCgpCdWdmaXhlcwotLS0tLS0tLQoKLSBG
aXhlZCByZXNwb25zZSBoZWFkZXIgaGFuZGxpbmcgdG8gcmVwbGFjZSBvYnNvbGV0ZSBmb2xkZWQg
aGVhZGVyIGxpbmVzCiAgKGBvYnMtZm9sZGApIHdpdGggc3BhY2VzIGluIGFjY29yZGFuY2Ugd2l0
aCBSRkMgOTExMiwgcHJldmVudGluZyByYXcgQ1JMRgogIHNlcXVlbmNlcyBmcm9tIGFwcGVhcmlu
ZyBpbiBoZWFkZXIgdmFsdWVzIHN1Y2ggYXMgYGBTZXQtQ29va2llYGAuCiAgKGAjMTM2MiA8aHR0
cHM6Ly9naXRodWIuY29tL3VybGxpYjMvdXJsbGliMy9pc3N1ZXMvMTM2Mj5gX18pCi0gRml4ZWQg
dXNhZ2Ugb2YgYGBwcm94eV9zc2xfY29udGV4dGBgIHdpdGggYGBQcm94eU1hbmFnZXJgYCB3aGVu
CiAgYGB1c2VfZm9yd2FyZGluZ19mb3JfaHR0cHM9VHJ1ZWBgLiBQYXNzaW5nIGBgc3NsX2NvbnRl
eHRgYCBpbnN0ZWFkIG9mCiAgYGBwcm94eV9zc2xfY29udGV4dGBgIGZvciBIVFRQUyBwcm94aWVz
IGluIHRoaXMgY29uZmlndXJhdGlvbiBub3cgZW1pdHMgYQogIGBgRnV0dXJlV2FybmluZ2BgIGFu
ZCB3aWxsIHJhaXNlIGFuIGVycm9yIGluIHYzLjAuCiAgKGAjMjU3NyA8aHR0cHM6Ly9naXRodWIu
Y29tL3VybGxpYjMvdXJsbGliMy9pc3N1ZXMvMjU3Nz5gX18pCi0gQ2hhbmdlZCBiZWhhdmlvciBv
ZiB0aGUgZGVmYXVsdCBgYENvbm5lY3Rpb25Qb29sLnBvb2xgYCBpbml0aWFsaXphdGlvbi4KICBg
YExpZm9RdWV1ZWBgIGlzIG5vdyByZXNvbHZlZCBmcm9tIHRoZSBgYHF1ZXVlYGAgbW9kdWxlIGFm
dGVyIHRoZQogIGBgQ29ubmVjdGlvblBvb2xgYCBpcyBpbnN0YW50aWF0ZWQgaW5zdGVhZCBvZiB1
c2luZyB0aGUgZGVmYXVsdCBjYWNoZWQKICBgYFF1ZXVlQ2xzYGAgY2xhc3MgcHJvcGVydHkuIFRo
aXMgaXMgZG9uZSBiZWNhdXNlIHNvbWV0aW1lcyB0aGUKICBgYHF1ZXVlLkxpZm9RdWV1ZWBgIGlz
IG1vbmtleS1wYXRjaGVkIGxhdGUgaW4gdGhlIHByb2dyYW0sIHN1Y2ggYXMgYnkgZ2V2ZW50Lgog
IChgIzMyODkgPGh0dHBzOi8vZ2l0aHViLmNvbS91cmxsaWIzL3VybGxpYjMvaXNzdWVzLzMyODk+
YF9fKQotIFJhaXNlZCBgYFVucmV3aW5kYWJsZUJvZHlFcnJvcmBgIGluc3RlYWQgb2YgYGBWYWx1
ZUVycm9yYGAgd2hlbiByZXRyeWluZyBhCiAgcmVxdWVzdCB3aG9zZSBib2R5IGhhZCBgYHRlbGwo
KWBgIGJ1dCBub3QgYGBzZWVrKAoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAz
MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0
YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi97cHl0aG9uMy11cmxsaWIzXzIuNy4w
LmJiID0+IHB5dGhvbjMtdXJsbGliM18yLjguMC5iYn0gICAgICB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJsbGliM18yLjcuMC5iYiA9PiBweXRob24zLXVybGxp
YjNfMi44LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXVybGxpYjNfMi43LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXJsbGliM18yLjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjcuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNf
Mi44LjAuYmIKaW5kZXggOWU3M2E0OWJjYS4uNGFhZmUyZDYzZCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi43LjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi44LjAuYmIKQEAgLTMs
NyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS91cmxsaWIzL3VybGxpYjMi
CiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0
O21kNT01MmQyNzNhMzA1NGNlZDU2MTI3NWQ0ZDE1MjYwZWNkYSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjIzMWUwZWMzYjYzY2ViMTQ2NjdjNjdiZTYwZjJmMmM0MGE1MThjYjM4YjAzYWY2MGFi
YzgxM2RhMjY1MDVmNGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjNiZjJlYWQ0Yzg3OTQyNmVi
ZjIyZWYyYTc4MWVlYjRhYTNiNGFlNzk4YTA0MzU1MDZmODY4N2ZkNWJiOWI2MyIKIAogaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4xCgo=

--===============0634875104592377271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info -> /usr/lib/python3.14/site-packages/urllib3-2.8.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/urllib3-2.8.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info moved to /usr/lib/python3.14/site-packages/urllib3-2.8.0.dist-info
Changes to packages/x86_64-linux/python3-pyproject-hooks-native (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info

--===============0634875104592377271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.8.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-urllib3: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info -> /usr/lib/python3.14/site-packages/urllib3-2.8.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/urllib3-2.8.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.7.0" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 944920 to 976663 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.14/site-packages/urllib3-2.7.0.dist-info moved to /usr/lib/python3.14/site-packages/urllib3-2.8.0.dist-info
Changes to packages/x86_64-linux/python3-pyproject-hooks-native (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info

--===============0634875104592377271==--

