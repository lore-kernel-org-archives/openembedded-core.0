Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9B91B78650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:10:13 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id v21so23779268ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PQMcSNenIeOE+TVZ8kZ0gBAZXg0iWEqO7+dyACj2Ukc=;
	b=ppGE2E7qCOUUKSX27lLS0lanFk3A0uPvshvIpNLS9nGsEFqrgq8MBNzYgMicmZ4arh
	g7sjbnO6ibFQBEZSz5n+ZoROzrD/w9iWk7JO8TORwlUefucD0dsQqQOg2CNSs+NjPVHf
	5RdnbhA0zw05xcKwWk5Vcpc4HW7KhiBFHfaZp6CnBRGZWilSVhSrYdW0H22HFDCJLLwh
	f7sJuVWBzEkNLi4k0DR1xv4eKaxXnUvRcFoUANRzTOmLwB+rJUmtAiK7cTIqIEbNflo+
	+iwQs1xsQ/jhSCeogIMgeFMCxVlr04alKO40oM/3eSEdib+8+miBl/uTHOjrL1xDN/Dw
	tAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PQMcSNenIeOE+TVZ8kZ0gBAZXg0iWEqO7+dyACj2Ukc=;
	b=g4P4bBbLL5qbDblWqoy2T5XC9hcy7sEym0kCgKuuKlZTsM7EZkKzkjKPG25gQXOAxa
	YxNuKPpMt/DIhrDQGOatCU76m1e/LelttPt8FjIiYot3ah+0wHrWX8sz0tPtLaHkIcPK
	JAgeaA9MDXdm5R+hzM+vWpivoXZtF6E5P/IJdBtbW6PVspNPaiGlJlBmxg4RMx8KKxF7
	CIniwJABkHyImmUA0ZvzB+6xmRZecDFyanUVWzSv81fB2FIOUv7R52p3v/IFeRyjlJ24
	xuPSLBqn7Hg7TYCtxmohLp3SotO6fkN4Me+ffefW3Sea1eawEqV2JmacF/sN8c7aub8X
	PJqg==
X-Gm-Message-State: AJaThX6B+o1BmbAV+QTeBe1o/PsrSe8SbHezHfGR91HUA/okQBdhkwXS
	oYAzb4zXcLPe1+owWYU5buKqCP6G9CWSWB3d1ahxvw==
X-Google-Smtp-Source: AGs4zMZH4uqS4HZU5aj2+Zss8PhTjQ/IU77CyUloRyKPMY6L5s7Va0MBZp4Rz6bsH5qsAkcHSIaLzf2ggCbKXwqNnso=
X-Received: by 10.107.178.145 with SMTP id b139mr23272044iof.52.1511367014821; 
	Wed, 22 Nov 2017 08:10:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Wed, 22 Nov 2017 08:09:54 -0800 (PST)
In-Reply-To: <a7fe2ae2-3c8c-44d9-64e9-e68d631a0934@linux.intel.com>
References: <20171122160414.14093-1-ross.burton@intel.com>
	<20171122160414.14093-2-ross.burton@intel.com>
	<a7fe2ae2-3c8c-44d9-64e9-e68d631a0934@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Nov 2017 16:09:54 +0000
Message-ID: <CAJTo0LbewO2gKUhVYteHWqHigNdUakSbTOcF0ESF4_6G7i9uoQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] postinst: fix and simplify the postinst test recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 16:10:13 -0000
Content-Type: multipart/alternative; boundary="001a114ca1620b521c055e948e13"

--001a114ca1620b521c055e948e13
Content-Type: text/plain; charset="UTF-8"

On 22 November 2017 at 16:09, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 11/22/2017 06:04 PM, Ross Burton wrote:
>
> +    if [ -n "$D" ]; then
>> +        echo "Delaying ${PN}-delayed-b until first boot"
>>           exit 1
>> -      fi
>>
>
> I still think this 'exit 1' madness should be fixed. But maybe some other
> time.
>

Yes, agreed totally.

Ross

--001a114ca1620b521c055e948e13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 22 November 2017 at 16:09, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On 11/22/2017 06:04 PM, Ross Burton wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 if [ -n &quot;$D&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Delaying ${PN}-delayed-b until firs=
t boot&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
</blockquote>
<br></span>
I still think this &#39;exit 1&#39; madness should be fixed. But maybe some=
 other time.<br></blockquote><div><br></div><div>Yes, agreed totally.</div>=
<div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a114ca1620b521c055e948e13--
