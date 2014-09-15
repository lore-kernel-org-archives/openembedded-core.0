Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id D78A460144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:36:56 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so3853509qae.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=awYIlphxQEDqJod55cCgMqw41KEl/3TSG+ueEkAcHKc=;
	b=fvFcc4Q/R+JpcVO9a3zqtNwGN0RBClhqqKyVdCr5W4lwmJJuX5G3wfL9L6SfLOoQ3C
	6vp5q1cYJ+WQtMWGsUfhfK12eKjVPuohC70KS10fNSNKLX83plUUhBi7dm4edYA3mH8l
	U9k+ZIxr2QUHwJBR53N9H8oxE51B/llJNJqOQdt+p8RXeog/ab7qxLm5V3g5gYyjldQ1
	AxUuad2Pvp1JyVMUEujzR7O9rfFJqRr7kMYnzTGR+oj7YhhZFrowI8ijHBjqNpHuTgLY
	+SbYCHvJUNwl6TX9o1TKtGMdIHWpfrOKkRTA8h9t34hBk4iqE3nMI+pwV1H6Ys4QfV+G
	Lf/Q==
X-Gm-Message-State: ALoCoQmyZ2FpRnk+8ivo/6iD1I75P8NXPXrFUAG3SP12cGQo5lFxdrvkhpOjX6ePWFNlwLFv1KZR
X-Received: by 10.140.40.84 with SMTP id w78mr37992014qgw.87.1410791816649;
	Mon, 15 Sep 2014 07:36:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:36:36 -0700 (PDT)
In-Reply-To: <CAP9ODKpSNOeXfgLbviu4G_Bw2Tc9y86cTNmoWDFeSsOFZC4M3Q@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
	<CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
	<CAJTo0LZur5=dt6pfPawcEAM50M9W7zd-0_uoDvj5s74RCgNubA@mail.gmail.com>
	<CAP9ODKpSNOeXfgLbviu4G_Bw2Tc9y86cTNmoWDFeSsOFZC4M3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:36:36 +0100
Message-ID: <CAJTo0Lbz62+cNOohg8LqJ+4fHA1u5podgELqJsyJLYJnBSdD6A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Mon, 15 Sep 2014 14:37:00 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 15:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I think it is a way better base for work but I really don't care as I
> use my own recipe in fsl-arm and so does TI.

And that's the problem really isn't it. :)  Why do you both use your
own recipe, instead of keeping the u-boot in oe-core up to date?

Ross

