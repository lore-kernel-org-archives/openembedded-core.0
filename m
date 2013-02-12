Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U5JJG-0004xv-Pn
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:06:42 +0100
Received: by mail-lb0-f174.google.com with SMTP id l12so273067lbo.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=QqIZaerVzB98Y7pIUx6+ZsQRP5jcdOVmN5PEIOeBZ8o=;
	b=AeiClSO1MfP7d/9yl/5GyHyrnhylTyuquO6KIiE0HFO8AJhyeIkws/yzBPdYY5Zx9q
	RUi8NJAojJUgfVNFDWgcSClNOM5TDF9GQ6GZBmI3cQA5tXA5Zh+quwq+feRGSgQi+WCQ
	MYL7pOgcStzA65ecJsaI64Fpe2tB/odHo9Q8YtXiB2uFtBm+Sni1T460Y9Gau/7fsOhR
	QU3q8fmQfwiXMbfR9LSTm6iJtkZvcQQ0yJGIlXioFtJ0ksL/t/X8w6EiGrI4onanXrZn
	HVDqMObbObN48oQLcfBmTtkCDIig24/lNkcSGIP9sSMK6Y45eh90CtAzmWuMchNuE93g
	Vj4g==
MIME-Version: 1.0
X-Received: by 10.152.127.202 with SMTP id ni10mr17251757lab.6.1360687822999; 
	Tue, 12 Feb 2013 08:50:22 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 12 Feb 2013 08:50:22 -0800 (PST)
In-Reply-To: <1360683160.30425.29.camel@ted>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
	<5110A9D1.20208@windriver.com>
	<CADkTA4MN+jzTZCLBK17mJvhvLbAB7yf-8Fr8bRBaM7c=b=_avw@mail.gmail.com>
	<1360675313.30425.14.camel@ted>
	<CADkTA4PqMtT5Jt3yuaKO=f=TX4hYk4qFrCP_2amMi3Y=KbW3uw@mail.gmail.com>
	<1360683160.30425.29.camel@ted>
Date: Tue, 12 Feb 2013 11:50:22 -0500
Message-ID: <CADkTA4PWV5zc7LtXZiMORT=XcMB-ydkxc2qZbsfrE0S_7oVXzA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 17:06:46 -0000
X-Groupsio-MsgNum: 35373
Content-Type: multipart/mixed; boundary=f46d042c6aeb57114e04d589d258

--f46d042c6aeb57114e04d589d258
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 10:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-12 at 09:06 -0500, Bruce Ashfield wrote:
>> On Tue, Feb 12, 2013 at 8:21 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Tue, 2013-02-05 at 11:29 -0500, Bruce Ashfield wrote:
>> >> On Tue, Feb 5, 2013 at 1:42 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>> >>         On 02/02/2013 03:08 AM, Bruce Ashfield wrote:
>> >>         > On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold
>> >>         > <sgw@linux.intel.com> wrote:
>> >>         >         On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
>> >>         >                 On Fri, Feb 1, 2013 at 4:00 AM,
>> >>         >                 <Qi.Chen@windriver.com
>> >>         >                 <mailto:Qi.Chen@windriver.com>> wrote:
>> >>         >                 <mailto:Qi.Chen@windriver.com>>
>> >>         >                     Both the implementation and the use case
>> >>         >                 are similar to yocto kernel's
>> >>         >                     configuration fragments.
>> >>         >                 I can fairly easily tweak the configuration
>> >>         >                 parts of the kern-tools to
>> >>         >                 handle this
>> >>         >                 use case as well. That would allow us to
>> >>         >                 re-use the kernel's merge_config.sh
>> >>         >                 script (with a minor dependency change) and
>> >>         >                 save some duplicated code. It
>> >>         >                 also gets you the advantage that you can
>> >>         >                 consolidate configuration fragments
>> >>         >                 outside of any build system, which isn't as
>> >>         >                 critical here, but something
>> >>         >                 that
>> >>         >                 is used quite a bit during kernel testing.
>> >>         >         Bruce,
>> >>         >
>> >>         >         Where is the merge_config.sh script today?  Would
>> >>         >         you propose moving it to the scripts dir and have
>> >>         >         the busybox recipe call it?
>> >>         >
>> >>         >
>> >>         > It's part of the mainline kernel, hence why grabbing the
>> >>         > guts out of it reproducing
>> >>         > it here isn't the best idea, we'll have a need to keep them
>> >>         > in sync. In fact, I have
>> >>         > 2 or 3 pending patches for it in the kern-tools repository
>> >>         > that I need to get upstream
>> >>         > (as an example).
>> >>         >
>> >>         >
>> >>         > I'd propose either creating a separate recipe for it (i.e.
>> >>         > like kconfig-frontends) or I could
>> >>         > keep it in kern-tools (badly named, but we can work on
>> >>         > that ;) and maintain / coordinate
>> >>         > changes to it.
>> >>         >
>> >>         >
>> >>         > I just don't want to see the effort happen twice, we are
>> >>         > busy enough!
>> >>         >
>> >>         >
>> >>         >         What would be your timing on making such a change,
>> >>         >         ie hold this patch until your get it merge or merge
>> >>         >         this and then fix it when you merge your changes?
>> >>
>> >>         > I could feasibly get it done in the next few weeks, the
>> >>         > changes aren't bug, I just
>> >>         > have to avoid regressions on either side (kernel or busy
>> >>         > box).
>> >>
>> >>         > That being said, the interface to the SRC_URI is the same
>> >>         > for the two, so if we are
>> >>         > ok with me arriving and removing the in-recipe support, I
>> >>         > guess I can't object too
>> >>         > much :) The only risk is that if anyone starts using this
>> >>         > first support immediately,
>> >>         > I do risk regressing their use case, where if it never goes
>> >>         > in, that won't happen.
>> >>
>> >>         > Cheers,
>> >>         > Bruce
>> >>
>> >>         Hi Bruce,
>> >>
>> >>         I just tried to reuse the kernel's merge_config.sh script, and
>> >>         it turned out well.
>> >>         The patch is in attachment.
>> >>
>> >>         Is it enough for now?
>> >>
>> >> Yep, this is enough for now. It re-uses the significant part of the
>> >> infrastructure, which
>> >> is the important part. Once it is in tree, I can refine the dependency
>> >> and some other
>> >> minor modifications.
>> >>
>> >> Feel free to add my Signed-off-by: to the patch as well.
>> >
>> > This patch triggers a failure on the autobuilder:
>>
>> Hmmm. I didn't realize this had been picked up yet, I was waiting for
>> a repost with the Sign-offs. I assume this is master under test ? I can
>> pick up the patch from there and send an updated patch, since Chen Qi
>> won't be around to look into this for a few days.
>
> It was master under test, it won't make master until it works :)
>
> I don't mind who sends me the working version.

Attached is the fixed up patch with DEPENDS, the existing one had a typo
in:

  do_config[depends] = "kern-tools-native:do_populate_sysroot"

I've gone ahead and replaced it with a DEPENDS and tested the failure case
here.

This is a complete patch replacement, let me know if you'd prefer something
incremental.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

--f46d042c6aeb57114e04d589d258
Content-Type: application/octet-stream; 
	name="0001-busybox-add-config-fragments.patch"
Content-Disposition: attachment; 
	filename="0001-busybox-add-config-fragments.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hd3ae5cb0

RnJvbSAxZGM0OGJhOTg3MmFmYzEyZDgyMmMzYzM5OWI0YmQ0YWYwNDJkMDdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CkRhdGU6
IFR1ZSwgNSBGZWIgMjAxMyAxNDozNjo0MCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGJ1c3lib3g6
IGFkZCBjb25maWcgZnJhZ21lbnRzCgpBZGQgY29uZmlnIGZyYWdtZW50cyB0byBidXN5Ym94LgoK
VGhlIGltcGxlbWVudGF0aW9uIG1ha2VzIHVzZSBvZiBtZXJnZV9jb25maWcuc2ggc2NyaXB0IGlu
IGtlcm4tdG9vbHMtbmF0aXZlLgpUaGUgdXNlIGNhc2UgaXMgc2ltaWxhciB0byB0aGUgeW9jdG8g
a2VybmVsJ3MgY29uZmlndXJhdGlvbiBmcmFnbWVudHMuCgpXZSBhbHNvIGFkZCBrZXJuLXRvb2xz
LW5hdGl2ZSB0byBidXN5Ym94J3MgREVQRU5EUyB2YXJpYWJsZSB0byBlbnN1cmUKdGhhdCBtZXJn
ZV9jb25maWcuc2ggaXMgYXZhaWxhYmxlIHdoZW4gcmVxdWlyZWQuCgpbWU9DVE8gIzMzNzldCgpT
aWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+ClNpZ25lZC1vZmYt
Ynk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEB3aW5kcml2ZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5jb20+Ci0tLQogbWV0YS9yZWNpcGVz
LWNvcmUvYnVzeWJveC9idXN5Ym94LmluYyB8ICAgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9i
dXN5Ym94L2J1c3lib3guaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94Lmlu
YwppbmRleCA5NzJlN2QwLi5iNjU2YTkyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9i
dXN5Ym94L2J1c3lib3guaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJv
eC5pbmMKQEAgLTM3LDYgKzM3LDggQEAgUlJFQ09NTUVORFNfJHtQTn0gPSAiJHtQTn0tc3lzbG9n
ICR7UE59LXVkaGNwYyIKIAogaW5oZXJpdCBjbWwxIHVwZGF0ZS1yYy5kCiAKK0RFUEVORFMgPSAi
a2Vybi10b29scy1uYXRpdmUiCisKICMgaW50ZXJuYWwgaGVscGVyCiBkZWYgYnVzeWJveF9jZmco
ZmVhdHVyZSwgZmVhdHVyZXMsIHRva2VucywgY25mLCByZW0pOgogCWlmIHR5cGUodG9rZW5zKSA9
PSB0eXBlKCIiKToKQEAgLTExMiw4ICsxMTQsMTkgQEAgZG9fcHJlcGFyZV9jb25maWcgKCkgewog
CWZpCiB9CiAKKyMgcmV0dXJucyBhbGwgdGhlIGVsZW1lbnRzIGZyb20gdGhlIHNyYyB1cmkgdGhh
dCBhcmUgLmNmZyBmaWxlcworZGVmIGZpbmRfY2ZncyhkKToKKyAgICBzb3VyY2VzPXNyY19wYXRj
aGVzKGQsIFRydWUpCisgICAgc291cmNlc19saXN0PVtdCisgICAgZm9yIHMgaW4gc291cmNlczoK
KyAgICAgICAgaWYgcy5lbmRzd2l0aCgnLmNmZycpOgorICAgICAgICAgICAgc291cmNlc19saXN0
LmFwcGVuZChzKQorCisgICAgcmV0dXJuIHNvdXJjZXNfbGlzdAorCiBkb19jb25maWd1cmUgKCkg
ewogCWRvX3ByZXBhcmVfY29uZmlnCisJbWVyZ2VfY29uZmlnLnNoIC1tIC5jb25maWcgJHtAIiAi
LmpvaW4oZmluZF9jZmdzKGQpKX0KIAljbWwxX2RvX2NvbmZpZ3VyZQogfQogCi0tIAoxLjcuMTAu
NAoK

--f46d042c6aeb57114e04d589d258--
