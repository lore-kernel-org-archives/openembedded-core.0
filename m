Return-Path: <petter@technux.se>
Received: from bin-vsp-out-04.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7C9767FB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 15:30:47 +0000 (UTC)
X-Halon-ID: 348cc562-6c3f-11e5-bfe4-005056917c0c
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-04.atm.binero.net (Halon Mail Gateway) with ESMTPA;
	Tue,  6 Oct 2015 17:30:42 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 06 Oct 2015 17:30:44 +0200
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: "Burton, Ross" <ross.burton@intel.com>
Organization: Technux
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
	<fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
	<CAJTo0LYiW1X+kZi0ra0JUMeywQVu4w492ULyRXcytpYFWiiwng@mail.gmail.com>
	<7d91e0a2a4abbb2e84558856e1c2fa6a@technux.se>
	<CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
Message-ID: <f6560c7a3f9ffd90e5a8bd754ce9e70a@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: petter@technux.se
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 15:30:49 -0000
Content-Type: multipart/alternative;
	boundary="=_5bedff2179ff794c2f11a82c1d3eff80"

--=_5bedff2179ff794c2f11a82c1d3eff80
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

2015-10-06 16:08 skrev Burton, Ross: 

> On 6 October 2015 at 14:43,
Petter Mabäcker <petter@technux.se> wrote:
> 
>> Great. As you will
notice also when formatted properly it will not apply due to that
readline63-001 and readline63-002 isn't applied so 'patchlevel' is
incorrect. That makes me wondering what the patching strategy is? In my
opinion we should consider adding the official readline-6.3 patches as
well. Should I add a bug report for that or leave it as is (depending on
the strategy...)?
> 
> Adding the rest of the patches would have been a
sensible thing to do. Right now, we're frozen as we're about to release
2.0, but a bug or patches post-release would be much appreciated. 
> 
>
Ross

I have created a defect and assigned myself
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=8451) and will send
something up when the normal integration is open again. 

BR Petter 

--=_5bedff2179ff794c2f11a82c1d3eff80
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>2015-10-06 16:08 skrev Burton, Ross:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br />
<div class=3D"gmail_quote">On 6 October 2015 at 14:43, Petter Mab&auml;cker=
 <span>&lt;<a href=3D"mailto:petter@technux.se">petter@technux.se</a>&gt;</=
span> wrote:<br />
<blockquote class=3D"gmail_quote" style=3D"margin: 0  0  0  .8ex; border-le=
ft: 1px  #ccc  solid; padding-left: 1ex;">
<p>Great. As you will notice also when formatted properly it will not apply=
 due to that readline63-001 and readline63-002 isn't applied so&nbsp; 'patc=
hlevel' is incorrect. That makes me wondering what the patching strategy is=
? In my opinion we should consider adding the official readline-6.3 patches=
 as well. Should I add a bug report for that or leave it as is (depending o=
n the strategy...)?</p>
<div class=3D"gmail_extra">&nbsp;</div>
</blockquote>
</div>
<br />Adding the rest of the patches would have been a sensible thing to do=
=2E&nbsp; Right now, we're frozen as we're about to release 2.0, but a bug =
or patches post-release would be much appreciated.</div>
<div class=3D"gmail_extra">&nbsp;</div>
<div class=3D"gmail_extra">Ross</div>
<div class=3D"gmail_extra">&nbsp;</div>
<div class=3D"gmail_extra">&nbsp;</div>
</div>
</blockquote>
<div class=3D"gmail_extra">I have created a defect and assigned myself (htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8451) and will send someth=
ing up when the normal integration is open again.</div>
<div class=3D"gmail_extra">&nbsp;</div>
<div class=3D"gmail_extra">BR Petter</div>
</body></html>

--=_5bedff2179ff794c2f11a82c1d3eff80--
