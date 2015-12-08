Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DE1AA60110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 07:12:54 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so7577570pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 23:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YdwrEUHw2p1Q7Q6ufNpMeBPjuVELq16KGIiEYKAjkOE=;
	b=KpUNryjY3R8r2B928gwgs6Zeeike88NVwwJfT4LUlCzHoSg53VsIOF6oM46ZuP3+IU
	vY7DCJnJqYEWY1Ye+1QxriGIeAjfEcubQdJ1E/7Po1lkVODXu8Imlo092v7hnwlKo19n
	jAexpht4Z+PEgG52cOGpPDi3PKElQcwJV/bk1imgHDzGcB98T0YTO4wxOF1S5aQ9/OZl
	q/Po16636yclzi2dGzXzV3y/UT7EZOPch0zCNNlHlXIJfMq+AT6TfXmg12KZQpFfyQ0v
	WBErSvGSOltVR320W4hzneQRCuAXbBdwJHt1ILXfeNfhjC+xa+CDrSs/6vA8YRtrbl/2
	gvcg==
X-Received: by 10.66.158.169 with SMTP id wv9mr2766528pab.138.1449558775315;
	Mon, 07 Dec 2015 23:12:55 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5933:3119:130:5e9b?
	([2601:646:8802:5d5c:5933:3119:130:5e9b])
	by smtp.gmail.com with ESMTPSA id
	n16sm2343583pfa.53.2015.12.07.23.12.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Dec 2015 23:12:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <565EC7BE.6060105@windriver.com>
Date: Mon, 7 Dec 2015 23:12:48 -0800
Message-Id: <9CDC0749-BCB9-4D45-99F7-55F52B4CCE6B@gmail.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
	<8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
	<CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
	<565EBF04.6050509@windriver.com>
	<CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com>
	<565EC7BE.6060105@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: gcc optimization level 2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Dec 2015 07:12:55 -0000
X-Groupsio-MsgNum: 74438
Content-Type: multipart/signed;
	boundary="Apple-Mail=_71D9E655-DF95-48D2-A79C-A115BED0F335";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_71D9E655-DF95-48D2-A79C-A115BED0F335
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_98D9C1C7-D044-4770-9CEB-D8070147E748"

--Apple-Mail=_98D9C1C7-D044-4770-9CEB-D8070147E748
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 2, 2015, at 2:28 AM, Hongxu Jia <hongxu.jia@windriver.com> =
wrote:
>=20
> On 12/02/2015 05:57 PM, Burton, Ross wrote:
>>=20
>> On 2 December 2015 at 09:51, Hongxu Jia <hongxu.jia@windriver.com =
<mailto:hongxu.jia@windriver.com>> wrote:
>> The root cause is the qemu didn't support gcc optimization level 3 =
very well.
>>=20
>> Oh, so the problem only appears in qemu if you enable tuning that is =
known to be broken in qemu?
>=20
> Yes, since I tested qemux86/qemux86-64 with default tune, and =
everything is ok.
>=20
>> I don't think we should apply the Python workaround to oe-core as =
everyone will suffer for a configuration that is known to be broken (and =
isn't enabled in oe-core).
>=20
> Trace the issue costs a lot of time,  the original failure was =
invoking
> 'smart update' in qemu, and found out the python md5/sha checksum
> output incorrect, and then found out qemu86-64 with corei7-64 did
> not support gcc optimization level 3 '-O3' very well [YOCTO #8748]
>=20
> BTW, boot the same image with virtualbox, everything is ok
>=20

This is a Qemu bug, So it should be persued in that direction. Secondly, =
this patch should be applied only
for emulator BSPs and not across the board

> //Hongxu
>=20
>>=20
>> Ross
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_98D9C1C7-D044-4770-9CEB-D8070147E748
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Dec 2, 2015, at 2:28 AM, Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com" class="">hongxu.jia@windriver.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class="">
  
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" class="">
  
  <div bgcolor="#FFFFFF" text="#000000" class="">
    <div class="moz-cite-prefix">On 12/02/2015 05:57 PM, Burton, Ross
      wrote:<br class="">
    </div>
    <blockquote cite="mid:CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com" type="cite" class="">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" class="">
      <div dir="ltr" class="">
        <div class="gmail_extra"><br class="">
          <div class="gmail_quote">On 2 December 2015 at 09:51, Hongxu
            Jia <span dir="ltr" class="">&lt;<a moz-do-not-send="true" href="mailto:hongxu.jia@windriver.com" target="_blank" class="">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br class="">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000" class="">The root cause is
                the qemu didn't support gcc optimization level 3 very
                well.<br class="">
              </div>
            </blockquote>
          </div>
          <br class="">
          Oh, so the problem only appears in qemu if you enable tuning
          that is known to be broken in qemu?&nbsp; </div>
      </div>
    </blockquote>
    <br class="">
    Yes, since I tested qemux86/qemux86-64 with default tune, and
    everything is ok.<br class="">
    <br class="">
    <blockquote cite="mid:CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com" type="cite" class="">
      <div dir="ltr" class="">
        <div class="gmail_extra">I don't think we should apply the
          Python workaround to oe-core as everyone will suffer for a
          configuration that is known to be broken (and isn't enabled in
          oe-core).</div>
      </div>
    </blockquote>
    <br class="">
    Trace the issue costs a lot of time,&nbsp; the original failure was
    invoking<br class="">
    'smart update' in qemu, and found out the python md5/sha checksum<br class="">
    output incorrect, and then found out qemu86-64 with corei7-64 did<br class="">
    not support gcc optimization level 3 '-O3' very well
    <meta http-equiv="content-type" content="text/html; charset=utf-8" class="">
    [YOCTO #8748]<br class="">
    <br class="">
    BTW, boot the same image with virtualbox, everything is ok<br class="">
    <br class=""></div></div></blockquote><div><br class=""></div><div>This is a Qemu bug, So it should be persued in that direction. Secondly, this patch should be applied only</div><div>for emulator BSPs and not across the board</div><br class=""><blockquote type="cite" class=""><div class=""><div bgcolor="#FFFFFF" text="#000000" class="">
    //Hongxu<br class="">
    <br class="">
    <blockquote cite="mid:CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com" type="cite" class="">
      <div dir="ltr" class="">
        <div class="gmail_extra"><br class="">
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br class="">
  </div>

-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""></body></html>

--Apple-Mail=_98D9C1C7-D044-4770-9CEB-D8070147E748--

--Apple-Mail=_71D9E655-DF95-48D2-A79C-A115BED0F335
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZmgvUACgkQuwUzVZGdMxR1wwCfWxkPOc5gCxP0/ysmMdW+LTrf
/LMAniR+OfvDDa6RRISIyP6YrdUvKTtC
=Gtle
-----END PGP SIGNATURE-----

--Apple-Mail=_71D9E655-DF95-48D2-A79C-A115BED0F335--
