Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3D00460110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:01:17 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id t15so140732558igr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4LNl3xecNvAD2ZyTHcCo/+juRcFXscvVLNw15EdSWM4=;
	b=HclCNKuJI/T3n5hKzlhSQQhdpZE7gouKuRkt+gHK/YTopzOZr59pe2jsEC6mF6WMKc
	BmG0+BNeF+zLsuNd96H57fWd2qVaQWGdLaK/LUpDdSU/oXGyPZ2i5J5UYW4AmIk3Qy44
	VFqJK+Xtlt5jdpv4EFXAK+i5iYoWuDsxR2s08wqlPXS2EiGKCjDNcTmVDU9C33HwwnWE
	UjRQDb2TkiH4aaWOjvWTVrfg+RT5DlZ3IdtFhRqt52BhPBqB9G3499ra+BJKkhNkZSud
	RepP3OMWHxUloUP2CAQUWlflfHDy1aGJVJ24H3LNg4zLh5YxgXIqRRMdHUH9lbTqJ3Jq
	G5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4LNl3xecNvAD2ZyTHcCo/+juRcFXscvVLNw15EdSWM4=;
	b=UL+5junLFMBJ6ksmWEVKnJ0YiIW2K1Xw8tRB+sXjRVNiwVSjxzLrwbA4su+ccnhqBH
	mWODxp/2rCMwTTSFyX72FS2myoun4Bj1TPwp5dWXhdHootXlanqqCK+Qd+TR1eE3E3tm
	+9u0Or3XUJUnK3ecPR1QTRuqy+56ulkklqnnzW6jCqCTAOxcp/IJJ7YmlnZEdIWy/3Lp
	VrO9dWRLz08HuaJ3vUE2WoIqaTW6lYiLDS5y3ZI44tJwccLIanXUyKgR8a6cXh4VLlYA
	8+htcV5lM04FkIDqxvyQpgVYiUwLJ58/jZSPgnq4w/Z9fHkjhwovbtKR0yztW/3Ky9wi
	1ydw==
X-Gm-Message-State: ALoCoQnw6JKzmvqxc+xpvxsPMwWd0Kj41oXIKriU1tMJRVfi+w6q0CHJKBsevEwCAT4owMPaNyWFkvSJazL9wupKbGwYs4gb3sqpMo7oSyfOgpUOd+UgmnU=
X-Received: by 10.50.13.100 with SMTP id g4mr20768912igc.64.1452675678342;
	Wed, 13 Jan 2016 01:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 13 Jan 2016 01:00:58 -0800 (PST)
In-Reply-To: <1462345.ZzKELdxCEg@peggleto-mobl.ger.corp.intel.com>
References: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
	<1462345.ZzKELdxCEg@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jan 2016 09:00:58 +0000
Message-ID: <CAJTo0LYOEL472GHWWa+U1Kj8diVoU0e-uED_rsfvQnWDDNHPXQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Cached size of off_t
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
X-List-Received-Date: Wed, 13 Jan 2016 09:01:20 -0000
Content-Type: multipart/alternative; boundary=089e013c6614c83ccd052933694a

--089e013c6614c83ccd052933694a
Content-Type: text/plain; charset=UTF-8

On 13 January 2016 at 00:09, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > I think this value should be left for configure to compute and
> > autotools.bbclass should pass --{enable|disable}-largefile based upon
> > DISTRO_FEATURES enabling largefile support
> >
> > Do we see any downsides or point I might have missed
>
> IIRC I think the issue was older configure scripts without the capability
> to
> compute this properly (where we're not auto-reconf'ing them).
>

The fact that it changes based on configure options says that it really
shouldn't be a cached value.

It's very unlikely that there's configure scripts out there still that
don't use the "modern" autoconf type size detection and if there are
they're trivially patched to use the new macros.

Remove it, as this is going to cause very strange problems as large files
get enabled more globally.  In particular I'm now worrying about DBus which
just recently got a patch to enable large file support.

Ross

--089e013c6614c83ccd052933694a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2016 at 00:09, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"">&gt;=
 I think this value should be left for configure to compute and<br>
&gt; autotools.bbclass should pass --{enable|disable}-largefile based upon<=
br>
&gt; DISTRO_FEATURES enabling largefile support<br>
&gt;<br>
&gt; Do we see any downsides or point I might have missed<br>
<br>
</span>IIRC I think the issue was older configure scripts without the capab=
ility to<br>
compute this properly (where we&#39;re not auto-reconf&#39;ing them).<br></=
blockquote></div><br><div class=3D"gmail_extra">The fact that it changes ba=
sed on configure options says that it really shouldn&#39;t be a cached valu=
e.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It&=
#39;s very unlikely that there&#39;s configure scripts out there still that=
 don&#39;t use the &quot;modern&quot; autoconf type size detection and if t=
here are they&#39;re trivially patched to use the new macros.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Remove it, as this =
is going to cause very strange problems as large files get enabled more glo=
bally.=C2=A0 In particular I&#39;m now worrying about DBus which just recen=
tly got a patch to enable large file support.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--089e013c6614c83ccd052933694a--
