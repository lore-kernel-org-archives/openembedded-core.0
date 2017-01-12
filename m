Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 51DBD71C5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 17:39:32 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id 11so28088436qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9F0bDxlToJupOI0F8XrryLWCYKMZCHshqTDDIYIChDo=;
	b=JFDIpLstGgNmtmuM3gL/FrXOaKAbNYGQY6yViU9MSAMMki3sWGT9feUFAjO0TKvptI
	FFRpHH80T49SfX9koXyyvaeOAxkm7mEczmq5NCYB2QCQ9Vzjqa1du6GE8ChiyNzHcks4
	INmELZ8xxMnwbpOG3Ly2ds5pg17I57baUfbJgSEgZAgpIdJjvG2/3vR2NiB5G/ScEZU+
	EF5XzgTbyk0pocqfeSl1d7uVOge/HxD9wvjUXgMZY3sS/wevqe1j8xwzl9Liju/OcVLu
	UMMdK0n5hy8rgUvkzM19K7Zp3fVXeNECCz97lgZlOGQt1Z1Wb3/ej4o7PV4HEGe6qBEs
	UHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9F0bDxlToJupOI0F8XrryLWCYKMZCHshqTDDIYIChDo=;
	b=RXP4d1TqI6x35cKxZVLgiC+vGZLp9PwlXNDBA93KEHRYMi2k2SKTpV3XJ1Aib4MkWx
	T1JIwl3dGHyJ93ItevBdZKQVFjGDG4sKEK+y22TJI3mjvsjLrCg+lM1K46Sxdqk5S+2u
	LvOO+Ws6484g1DuJmUU0lHyz6NrRRQWD2SMj2jVHFtkVy4BIHe6IiVNRyoFPU+Lo3zGM
	csLzYzVxGIqFFPaBoWPOEfu4+c2vcD8QSZK6Yo6lIGXHG1TbBuvX7wm+bISUN7goUOri
	L3Ld4I/9fqMHmsR19Dhc3mmRGi8OeOdRKKEPheOklF/c6aQXL39GO+6yxZYJch6uf72J
	WIlg==
X-Gm-Message-State: AIkVDXIaIYsIQ22OEQJg8juxAvMJa/5aOjOwknxvxIKW9Aqyusmyq5HGQkxrLGBS6pW9l6R7DHxoG1S7ZCpYyp6h
X-Received: by 10.55.47.4 with SMTP id v4mr14375011qkh.77.1484242773147; Thu,
	12 Jan 2017 09:39:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 09:39:12 -0800 (PST)
In-Reply-To: <bb9a299e3834488f8c033f7e07515afe@svr-orw-mbx-01.mgc.mentorg.com>
References: <c93f2baf-e05d-fc8a-0789-9651dc5a1fd4@balister.org>
	<2377449.YFeu6CDXkj@peggleto-mobl.ger.corp.intel.com>
	<bb9a299e3834488f8c033f7e07515afe@svr-orw-mbx-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 17:39:12 +0000
Message-ID: <CAJTo0LajcqeYxpN6HeKpAzwBReHq0Zp0QNd8w-mCy2vu9iuWKQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [oe] [Openembedded-architecture] [yocto] OpenEmbedded Developers Meeting in Portland before ELC
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
X-List-Received-Date: Thu, 12 Jan 2017 17:39:33 -0000
Content-Type: multipart/alternative; boundary=001a114f41084115830545e93326

--001a114f41084115830545e93326
Content-Type: text/plain; charset=UTF-8

On 12 January 2017 at 14:18, Hudson, Sean <Sean_Hudson@mentor.com> wrote:

>   It's a great point.  I have volunteered Mentor's teleconference, but the
> onsite pickup is always a challenge.  Once we've finalized the location,
> I'll focus on making sure that we have a high quality pickup(s) in the
> room.  If possible, I'll get a true video-conference setup.
>

Definitely plural!  A conference phone with a number of microphones dotted
around the room seems to be a sensible idea.

Ross

--001a114f41084115830545e93326
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2017 at 14:18, Hudson, Sean <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Sean_Hudson@mentor.com" target=3D"_blank">Sean_Hudson@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":tb" class=
=3D"a3s aXjCH m159930bae17bde88">=C2=A0 It&#39;s a great point.=C2=A0 I hav=
e volunteered Mentor&#39;s teleconference, but the onsite pickup is always =
a challenge.=C2=A0 Once we&#39;ve finalized the location, I&#39;ll focus on=
 making sure that we have a high quality pickup(s) in the room.=C2=A0 If po=
ssible, I&#39;ll get a true video-conference setup.<br></div></blockquote><=
/div><br>Definitely plural!=C2=A0 A conference phone with a number of micro=
phones dotted around the room seems to be a sensible idea.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114f41084115830545e93326--
