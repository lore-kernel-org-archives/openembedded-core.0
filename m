Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8612771AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 08:30:51 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id f204so28046741ybc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nVfAPR4QxM3bap5j0g3MHit6xXK/dVXwLUTaf81T+oI=;
	b=o78/dtWzI7oG+Oem8huKexYPJZAlFIJBsoT4Q03c/TcPUrYItw7j7fekGWxloIFGwJ
	bTm2aM/XtSWkYO6KrAgHad7i7KDNfExp884stI5f3vFjzWknRpJdst3Os6CkZ4KgDr1M
	XaAJp6rEBDDF0e8wGVyGW/TzOfKtK01PPDRfhNgn+HkLAZycQlQ3Phk3Xhyify3KUIJ/
	wvzgauo1MuS6z/SQw/yxBOi0goe3a35iNfcis3DOghyqjcAyJvV6qqrZXTi6N5mw3tX8
	xCHWvDOvlv+YwRLR4J/laokVBGm/h5PiUesZszrfWIZEX1v7zwF+OfEhy7mk8VzChJEv
	0QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nVfAPR4QxM3bap5j0g3MHit6xXK/dVXwLUTaf81T+oI=;
	b=XOAcUe4dms9sVdTrXf+LFWKAVkaAXLZwiW3vJ+SbRKV4vGZxi2BT49//BhLMp9ZBKG
	mqm7kgh0IKKj985EM07X0XTIRZWEqOhOJpiX2HWPFcpqRcFsr4wzxp2MRQXNte+arRY3
	AY8lIDQwJuHVmXOZ9fs+ObGxFuJag+UnnnPXjZJDpBaTuhh0FbnM3HM6pmb55q6X/89o
	bMyWTeR4ykoG10aukjZjMKZmnUPuz8Aw3ysXYGGTXVOeMHLKLNpkya/l58lY1eZWRhye
	x/rIskmVA0vIlK7Rb9HMCUu9CWcoWHPVAApHAS+iDsL1wQIK+o4tukCHAte/kze9Lhf9
	zzuA==
X-Gm-Message-State: AFeK/H3fswE8/v+ohwFNb4bX+RfpCvxyEWFx0BmnYeNiUt1ZyPJyBZ+Bqz6p0tSWK20RraIngmIe0jlJczgBKRpU
X-Received: by 10.37.221.134 with SMTP id u128mr10693980ybg.51.1491208252171; 
	Mon, 03 Apr 2017 01:30:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 3 Apr 2017 01:30:21 -0700 (PDT)
In-Reply-To: <CF0C948DE8E2634BB64BF489FF9EF7E7CB114D@PGSMSX105.gar.corp.intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
	<CAHiDW_HmcNpGPrmf+oDiKaU8EHS=RoXYZW3XkzPKuZKLFmNauw@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB114D@PGSMSX105.gar.corp.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 3 Apr 2017 11:30:21 +0300
Message-ID: <CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org source
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
X-List-Received-Date: Mon, 03 Apr 2017 08:30:51 -0000
Content-Type: multipart/alternative; boundary=001a114bcea428822d054c3efa1a

--001a114bcea428822d054c3efa1a
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 10:53, Choong, Yin Thong <yin.thong.choong@intel.com>
wrote:

> Hi,
>
> The link seem like create by an individual, no a company or group.
> Therefore, we decide to drop this link and go for yoctoproject.org/mirror.
>

This is true, there's not that much in the repo itself to create trust. The
major show of trust is here though:
http://pkgs.fedoraproject.org/cgit/rpms/logrotate.git/commit/?id=9cb55142e51b82085d6c3136448c1f441454e351
Fedora/Red Hat themselves changed to use this repo when the fedorahosted
repos were EOL'd (see also Red Hat folks working on the github issues in
January).

If the release tarballs have been re-generated and the hashes no longer
match, I'd still prefer modifying the recipe to use github (after manually
diffing to make sure they are the same source release of course) but I can
understand a differing viewpoint in this case.

It would be good to mention the issue in the commit message, whichever way
this is solved.

Thanks,
  Jussi

--001a114bcea428822d054c3efa1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
 April 2017 at 10:53, Choong, Yin Thong <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:yin.thong.choong@intel.com" target=3D"_blank">yin.thong.choong@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-674909240707529295WordSection1">
<p class=3D"MsoNormal"><a name=3D"m_-674909240707529295__MailEndCompose"><s=
pan style=3D"font-size:11pt;font-family:calibri,sans-serif;color:rgb(31,73,=
125)">Hi,<u></u><u></u></span></a></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:calibri,sa=
ns-serif;color:rgb(31,73,125)">The link seem like create by an individual, =
no a company or group. Therefore, we decide to drop this link and go for <a=
 href=3D"http://yoctoproject.org/mirror" target=3D"_blank">yoctoproject.org=
/mirror</a>.</span></p></div></div></blockquote><div><br></div><div>This is=
 true, there&#39;s not that much in the repo itself to create trust. The ma=
jor show of trust is here though: <a href=3D"http://pkgs.fedoraproject.org/=
cgit/rpms/logrotate.git/commit/?id=3D9cb55142e51b82085d6c3136448c1f441454e3=
51">http://pkgs.fedoraproject.org/cgit/rpms/logrotate.git/commit/?id=3D9cb5=
5142e51b82085d6c3136448c1f441454e351</a></div><div>Fedora/Red Hat themselve=
s changed to use this repo when the fedorahosted repos were EOL&#39;d (see =
also Red Hat folks working on the github issues in January).</div><div><br>=
</div><div>If the release tarballs have been re-generated and the hashes no=
 longer match, I&#39;d still prefer modifying the recipe to use github (aft=
er manually diffing to make sure they are the same source release of course=
) but I can understand a differing viewpoint in this case.</div><div><br></=
div><div><div>It would be good to mention the issue in the commit message, =
whichever way this is solved.</div><div><br></div></div><div>Thanks,<br></d=
iv><div>=C2=A0 Jussi</div><div><br></div><div><br></div></div></div></div>

--001a114bcea428822d054c3efa1a--
