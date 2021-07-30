Subject: SYSROOTS_EXCLUDEDEPS_SYSROOT changing more hashes than I expect
To: openembedded-core@lists.openembedded.org
From: "Jate Sujjavanich" <jatedev@gmail.com>
X-Originating-Location: Tallahassee, Florida, US (63.148.217.19)
X-Originating-Platform: Mac Firefox 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 08:02:00 -0700
Message-ID: <j56E.1627657320792818740.TZ4M@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="314MteYE7aPS3n3SL39z"

--314MteYE7aPS3n3SL39z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I added meta-java to my bblayers.conf file, and the next build invalidated =
much of my sstate cache. This included such recipes as perl, which I though=
t would be unrelated to that layer. Through some digging, it appears that t=
he addition to SYSROOTS_EXCLUDEDEPS_SYSROOT in meta-java affects that recip=
e.

I wonder if this variable should be added to something like BB_HASHBASE_WH=
ITELIST. I'd think that the value in the exclusion should only affect the s=
ignature if it matches the current recipe. Is something more needed in a ha=
sh calculation?

- Jate S.

--314MteYE7aPS3n3SL39z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I added meta-java to my bblayers.conf file, and the next build invalidated =
much of my sstate cache. This included such recipes as perl, which I though=
t would be unrelated to that layer. Through some digging, it appears that t=
he addition to SYSROOTS_EXCLUDEDEPS_SYSROOT in meta-java affects that recip=
e.<br /><br />I wonder if this variable should be added to something like B=
B_HASHBASE_WHITELIST. I'd think that the value in the exclusion should only=
 affect the signature if it matches the current recipe. Is something more n=
eeded in a hash calculation?<br /><br />- Jate S.

--314MteYE7aPS3n3SL39z--
