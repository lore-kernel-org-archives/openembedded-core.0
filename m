Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF42731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:54:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so12632174wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 02:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I1ACUxtAxPkPhv21l23N33sJs+LJOVRmZFd42MUiB+c=;
	b=cs0LxWPwTMQFaLR2zV//oXJthiFw6kujY9Pulmj7Pc0DepZ8jhYYeo9MnYUr4gUxCn
	Sw0EgaBWLXbWF3kQyBKimIjNueF0/kzILprGe1/0JTOUNqvGX11BRy/ZWz4jV7U7ffV0
	3l51DdK+YV7LxIIMPt44mvL7MlRhAE2VX+2bF56BNpLwWWwztxCBfaQ1VEyI+8qf5M+M
	YNTsWYaeu71G15lxBJFrbAkRgOqzfDU5LelZMqGIBpvCt3TyT3cuXuTuaHQEo2AIYhyk
	TvM9kEnGZJnNjuj2pt+wkYOqJ1/MOnibsK+4Yb0UNATL9Ix7cDw3Rtlwx4JI19d2JcLp
	5wIA==
X-Gm-Message-State: AEkoousiF5B759RL4cAgZe6Mj0S4GyUAtJdOSnryTa4iruwru1Cp0PFwh/GKxZ1WCeUFsA==
X-Received: by 10.28.227.11 with SMTP id a11mr13824685wmh.29.1471859652158;
	Mon, 22 Aug 2016 02:54:12 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id 4sm20311543wmu.2.2016.08.22.02.54.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Aug 2016 02:54:11 -0700 (PDT)
Message-ID: <1471859650.3713.10.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 10:54:10 +0100
In-Reply-To: <7A51C236-FD8D-424C-9468-5796F4E54E10@gmail.com>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
	<1470986810.4987.8.camel@andred.net>
	<CAMKF1sqdpxYYrKnLkJ1VofY=qz5FEKsKWBo_7WrU+Cm_Kp1fDQ@mail.gmail.com>
	<1470987751.4987.13.camel@andred.net>
	<7A51C236-FD8D-424C-9468-5796F4E54E10@gmail.com>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Mon, 22 Aug 2016 09:54:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sa, 2016-08-20 at 07:51 -0700, Khem Raj wrote:
> > 
> > 
> Thinking more on this, there is an alternative to use strerror_l() rather
> than strerror_r(), that will avoid the non-confirming versions issue,
> moreover
> strerror_() is now recommended by posix to replace strerror_r() usage.
> 
> see
> 
> http://austingroupbugs.net/view.php?id=655
> 
> I think this is going to be a better solution since its portable.

Yeah, you're right. Let me cook up something...


Cheers,
Andre'


