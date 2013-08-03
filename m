Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 106236A59D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 09:27:21 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y11so1501387pdj.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 02:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=9o0q6Ii1iINUlUvuLvMgwgvy8H75ASO32q1EQdgSrio=;
	b=Hf5XfzGY14HVv0wTrOJ4KSKTcHmBn2oNi46JnY2fhRBNuk2MtlZVvHPK298sRZB8ce
	Kne/RBABoFZZwpcLmYeuW2AT9+xEl/83o1YHe3XgaYKNQnrQyhd8DE5BgMqdsDyHL/zG
	gtQSW/3HMD3y+1VutFd9rd58rR+QFaStlLRrApqj6r/GsfjosH+DmVs9sbi0MxyaK0pn
	4kXtR9L/TjpKOrtg1eyow4AqWi4s3sb/qeVz6pU4VyNYzuCdoy8lI/MHMCZtCfPqMPIg
	HWgvMJDKXk9OpWWCyQGr3OYdsVXI18nL8Z20zyV9jCk4H6EnJm7QGyrp4aw9bLPZ9553
	cDDw==
X-Received: by 10.66.216.129 with SMTP id oq1mr15023101pac.75.1375522041681;
	Sat, 03 Aug 2013 02:27:21 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id y6sm15202192pbl.23.2013.08.03.02.27.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 02:27:21 -0700 (PDT)
Message-ID: <51FCCBCD.6060106@gmail.com>
Date: Sat, 03 Aug 2013 19:22:21 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1375516603-9720-1-git-send-email-net147@gmail.com>
	<CAOMwXhPTMUKQ+H34k_6pdTPXk=Luy4VPQ8N=kd3hT4CTqJ8qJg@mail.gmail.com>
In-Reply-To: <CAOMwXhPTMUKQ+H34k_6pdTPXk=Luy4VPQ8N=kd3hT4CTqJ8qJg@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: add upstream QTBUG-32534 patch for QHttpMultiPart upload corruption
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
X-List-Received-Date: Sat, 03 Aug 2013 09:27:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/08/2013 7:11 PM, Laszlo Papp wrote:
> You need this fix right in your third-party project that it cannot 
> wait until the next upstream bugfix release, or if not you, someone 
> else requested it on the Yocto bugtracker?
The corruption is a P1 issue and there are currently no plans for Qt 
4.8.6 yet so it is uncertain when it will be released. There were more 
than 7 months between the Qt 4.8.4 and Qt 4.8.5 releases.

The issue affects one of my projects.

Regards,
Jonathan

