Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id EC27972F85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:20:39 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s186so9254150qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=duSMZG7bQR1iqwuhKb+kZWFBU/YsjVt7YkHVb9vFzz4=;
	b=qOVE0Fwh63YEEpuRw3ovaBZMsWTQOf89NgU3EtYREuMZPV5ViTwkh1Rzh1znvZN1hH
	EO30z/y6yQJ3f1eUom5GUy9uvL1IC0S4F5fvX2xEIff3dWdCvwHrpkHkRScqOLIUvNV1
	nn1+94oxHtx41c6GWKjBSHKSnc/Ft8OCX3AhcwCUXqZVm1yjBFEpJxgVIk8bSDG4YBZv
	HT3u/ad2uh5AgFrRmCM8THP8jherE342bDLcIGlr0IAnol8VoV030FTKDt8NdhVjjg8g
	OyT+mPf+a+DTtU4kmA2U/vZEuN1IZsuCMPMYlTH0z5CWuqRByQBtCnomBR5kL1kq68WY
	09hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=duSMZG7bQR1iqwuhKb+kZWFBU/YsjVt7YkHVb9vFzz4=;
	b=bMIEwWToY/IbypcFJAlYe2pCjP+F0qJ2niESaLT7xjraqJDlO6QeN6m34kYlIlRKLm
	Nf52uLdktKPBg1ZHKxQSGD4wel0MQe2V71F8w/aDEsajhR99jSG/UdXklYdQDJHpXEtw
	4Zg6JvWLjRDewYZTM/LbLkKDtkd2VKxAtM4KsmH5Giw9u22UXi/rmxHmixCFczuEbAIi
	rY+a+iqVH/ZESBRPuCjlN6W/fGIZsad0teCniAIESW4JR4/asYbJ4xEu9Tt9vIuxFTCV
	i5LgAk/OVLiS8amof3hnc9xd3ptKNI9Iyx8Co7YeAjwh22LqObLDh0GDo1gAyRfZPTpe
	69rg==
X-Gm-Message-State: AMke39kiG2tnu31vj2q8TqFUBHb4jFztqR4DqlIv9pG+At7ZJarjP3s1VSrokq3LAbj98HA7g2ZLK+k45H4hreR8
X-Received: by 10.237.39.158 with SMTP id a30mr1469923qtd.65.1488273640924;
	Tue, 28 Feb 2017 01:20:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 28 Feb 2017 01:20:20 -0800 (PST)
In-Reply-To: <956ffb9d-d58d-93b8-6989-6283009f4826@gmail.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com>
	<956ffb9d-d58d-93b8-6989-6283009f4826@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Feb 2017 09:20:20 +0000
Message-ID: <CAJTo0LYcdA8-7wXqkTtd1dk+5su3_deZE=K4yYm+R=JY2SV_kw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXMDnigJkxNw==?=
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
X-List-Received-Date: Tue, 28 Feb 2017 09:20:40 -0000
Content-Type: multipart/alternative; boundary=f403045f26a4b24852054993b5a6

--f403045f26a4b24852054993b5a6
Content-Type: text/plain; charset=UTF-8

On 28 February 2017 at 02:09, akuster808 <akuster808@gmail.com> wrote:

> o   rpm v4/dnf to replace rpm v5/smart?
>
> IMHO, we should include dnf in 2.3 so folks can start playing with it and
> remove smart in 2.4.


Not possible: dnf requires rpm4.  In the current work there is no attempt
at letting the user pick rpm4 or rpm5.

Personally I think we should leave this for 2.4M1.  It's a major change and
needs many eyes.


> o   Separate out elderly GPLv2 into a separate layer?
>
> yes, but maybe not for 2.3 if its a large effort.


I suspect for 2.3 this would be a matter of moving a few recipes into
another layer, which for testing purposes the autobuilder always includes.
So that should just be a matter of move recipes, layer version bump, update
autobuilder to conditionally fetch the layer.

o   Graphics stack vulkan changes?
>
> The "Go" changes hit before the vulkan. Both should have the same rules
> applied which ever way the decision goes.


They should be considered independently.

Vulkan current requires a development snapshot of Mesa, needs tweaking of
PACKAGECONFIG, and the only supported BSP doesn't work out of the box.
Seeing it work is a great step forward but there's many open questions and
whilst I'd love to put "Vulkan support" on the 2.3 release notes I'm not
yet convinced we're ready.  I guess it comes down to how long it takes the
current queue to stabilise: the current fire is over the testing of minimal
eSDKs.

Ross

--f403045f26a4b24852054993b5a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 February 2017 at 02:09, akuster808 <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><blockquot=
e type=3D"cite"><div class=3D"m_6518131125971471240WordSection1"><p style=
=3D"margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.000=
1pt;vertical-align:baseline"><span><span>o<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">=C2=A0=C2=A0
              </span></span></span><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:black">rpm
            v4/dnf to replace rpm v5/smart?</span></p>
      </div>
    </blockquote></span>
    IMHO, we should include dnf in 2.3 so folks can start playing with
    it and remove smart in 2.4.</blockquote><div><br></div><div>Not possibl=
e: dnf requires rpm4.=C2=A0 In the current work there is no attempt at lett=
ing the user pick rpm4 or rpm5.</div><div><br></div><div>Personally I think=
 we should leave this for 2.4M1.=C2=A0 It&#39;s a major change and needs ma=
ny eyes.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><blockquote type=3D"cite"><div class=3D"m_6518131125971471240WordSect=
ion1"><p style=3D"margin-right:0in;margin-bottom:0in;margin-left:1.0in;marg=
in-bottom:.0001pt;vertical-align:baseline"><span><span>o<span style=3D"font=
:7.0pt &quot;Times New Roman&quot;">=C2=A0=C2=A0
              </span></span></span><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:black">Separate
            out elderly GPLv2 into a separate layer?</span></p>
      </div>
    </blockquote></span>
    yes, but maybe not for 2.3 if its a large effort.</blockquote><div><br>=
</div><div>I suspect for 2.3 this would be a matter of moving a few recipes=
 into another layer, which for testing purposes the autobuilder always incl=
udes.=C2=A0 So that should just be a matter of move recipes, layer version =
bump, update autobuilder to conditionally fetch the layer.</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D""><blockquote type=3D"cit=
e"><div class=3D"m_6518131125971471240WordSection1"><p style=3D"margin-righ=
t:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;vertical-al=
ign:baseline"><span><span>o<span style=3D"font:7.0pt &quot;Times New Roman&=
quot;">=C2=A0=C2=A0
              </span></span></span><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:black">Graphics
            stack vulkan changes?</span></p>
      </div>
    </blockquote></span>
    The &quot;Go&quot; changes hit before the vulkan. Both should have the =
same
    rules applied which ever way the decision goes.</blockquote></div><div =
class=3D"gmail_extra"><br></div>They should be considered independently.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Vulkan c=
urrent requires a development snapshot of Mesa, needs tweaking of PACKAGECO=
NFIG, and the only supported BSP doesn&#39;t work out of the box.=C2=A0 See=
ing it work is a great step forward but there&#39;s many open questions and=
 whilst I&#39;d love to put &quot;Vulkan support&quot; on the 2.3 release n=
otes I&#39;m not yet convinced we&#39;re ready.=C2=A0 I guess it comes down=
 to how long it takes the current queue to stabilise: the current fire is o=
ver the testing of minimal eSDKs.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--f403045f26a4b24852054993b5a6--
