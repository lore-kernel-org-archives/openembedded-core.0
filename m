Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 05EEE721CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Nov 2014 20:13:15 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q107so5888718qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Nov 2014 12:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y6lJs44asWngL9MNURwcCAevVhpJSJ9LaOEhDUdcpVQ=;
	b=ZN1e3dfEYw6uER52kfrLMDD9Pk6gQ/Rke29jit0t2FYDwE1obqKBXMXYhIVPP+RVW9
	ZBCo+dxxM4aoxW7TWOgbrasmhEU/nnwsF0dKxoBnUydNPBSuQya4U9qOAP3+lj3NXtUo
	bEzEBkBHPGWCsYV7j0hCJt8XSrVsi98bjbrTH8inwnbRVLUIfGonXzjzlpfWBk8E7hpr
	XpCZAszdyOlQ3KvaL5IKBq1GZsJ5k9tj3/QLF28Gfw9bHjVr30Wbx3Z2F7GfQxH+8kMN
	TA1AZIBJ1y2OX2PZWAbKQ3HHht9ujRFkSBcugTZwmspTJRiy2jzRJ2HCxz97dVpvlDsj
	kwNA==
X-Gm-Message-State: ALoCoQnpKpc6Y8f9ywq0cnCkM6zPPo6GWM0TlZ89t1ilXMRJwzeysyBKeZyz8LO9jr6pfEloa6/7
X-Received: by 10.224.93.6 with SMTP id t6mr14404093qam.93.1417291996333; Sat,
	29 Nov 2014 12:13:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Sat, 29 Nov 2014 12:12:56 -0800 (PST)
In-Reply-To: <CAOMwXhPV+N=m+VBZhk70DzZBAXt_QDjMhxm=sy+R9aO1zNpWNA@mail.gmail.com>
References: <CAOMwXhPV+N=m+VBZhk70DzZBAXt_QDjMhxm=sy+R9aO1zNpWNA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Nov 2014 20:12:56 +0000
Message-ID: <CAJTo0LYAOW8YC4bOU9068DFRy0wu67CcF8ztt-1_XPAV9XmC6w@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] toolchain-script: Add support for ccache builds with the SDK
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
X-List-Received-Date: Sat, 29 Nov 2014 20:13:21 -0000
Content-Type: multipart/alternative; boundary=089e01495028fc23ca050905013e

--089e01495028fc23ca050905013e
Content-Type: text/plain; charset=UTF-8

On 29 November 2014 at 08:46, Laszlo Papp <lpapp@kde.org> wrote:

> Including both Richard Purdie and Saul Wold as they were the main
> criticizers last time in the beginning of September when I submitted
> the first version of this patch.
>

I've merged this into my staging branch now that the point of the patch is
clear.

Ross

--089e01495028fc23ca050905013e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 November 2014 at 08:46, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"=
mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":1n2" class=3D"a3s" style=3D"=
overflow:hidden">Including both Richard Purdie and Saul Wold as they were t=
he main<br>
criticizers last time in the beginning of September when I submitted<br>
the first version of this patch.</div></blockquote><div><br></div><div>I&#3=
9;ve merged this into my staging branch now that the point of the patch is =
clear.</div><div><br></div><div>Ross</div></div></div></div>

--089e01495028fc23ca050905013e--
