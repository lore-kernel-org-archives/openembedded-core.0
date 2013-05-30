Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6153A608CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 18:26:22 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id wz12so825923pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 11:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=tFpmYCoc+1XK0aPE6Tt3Nc98bQaSN4P+c1q2UIeMzYo=;
	b=KHuCoPDjQ0SO3J7a0VwP9rIdN6By+WdxUlIz5KIqCHlptcRJMIYTIa0Qd8LuALP7rN
	fVrcsc27QTPnl/jBXqRrjduab4txehuU7xPhOfqnatybqIP4WLTiMlEbNmWhdOa+xUpO
	jtZzENs0eGR0CayNdil6yHwz2KjmB89OnLxItRMTF2tMM92zdg/wzu8JrQ8CQb1KxjmD
	73mYYxIB/O3/cf7jQKKgzDboP358XNNvpJLzI6O6I+jQAzyuEOl+CvgS+geR1Gm9Ybfc
	pxWjPxD4oBiRKHQIhKKKVn0b27vrDWJ64FmmiCG90JwG4RW+veSG6sfyIQHuD7RH90Qn
	rbYA==
X-Received: by 10.68.193.138 with SMTP id ho10mr9165868pbc.163.1369938383447; 
	Thu, 30 May 2013 11:26:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Thu, 30 May 2013 11:26:03 -0700 (PDT)
In-Reply-To: <20130530131142.4050a9c7@e6520eb>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
	<CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
	<CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
	<20130530123230.78dab18a@e6520eb> <1369910940.14887.295.camel@ted>
	<20130530131142.4050a9c7@e6520eb>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 May 2013 19:26:03 +0100
Message-ID: <CAJTo0LY=Fs9bFv-jSdmSrqx=Gna4obgN92XvRK2NcbhEOFywPg@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQl6WaAWyouFdA3ICWbypASSI/y+cghACVzl5NLvwKf+oYEbsFP+LZ1edFMWIBA8S8Z8UP+a
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 18:26:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 May 2013 12:11, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> inherit gnomebase and remove DEPENDS=3D""
> seems to work fine (the postinst and postrm scripts are removed).
> removing DEPENDS=3D"" is not a big issue as it only brings native
> packages :
> DEPENDS =3D autoconf-native automake-native gnome-common-native
> gnu-config-native libtool-native pkgconfig-native

Will you send a patch for this?

Ross

