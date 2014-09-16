Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 419DD71492
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 19:59:44 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id i17so599326qcy.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 12:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Azm6mRjqBZYWNRkzsuOn2+jj9/XhPVTIy+syog9H0CA=;
	b=aoFzPiNroBg5OGVrCpeCRJxwnHlmLe2/IO8e+SjdT01+h1ArleIYK5lan+QGCqqU+P
	/KadxATe9TVIenN1xVoCDA7E5Z8ECzGZ28GjTQWZAy9mxjyNQvx9ZG5uIgpvp5XQs/eC
	fSkkWjgsRFn7u5Mt66/7ZFfHjXyhnbybq+p4cc3TIFIb51bzKNUleemw7158XnWskpt8
	/2FpGKpbwt2Rv/qBW/iAsn2tv6puHy/Tot2cf3GC7OJCf9nYjs3VfGB1jmw05m/1BqYj
	uRoH5On8bciTHDxchaXXxSe6xyKGUPW7/A6rHhYMPYOMEhgmy6qecWXYc+yKlUdszZwI
	lBAw==
X-Gm-Message-State: ALoCoQnZrrgkMUNArieY2rcQQH2tDyI+8TQSXboXXX6nuZ3kk/m66ME+o4kXqWim2+jxJEKH0/AJ
X-Received: by 10.140.97.247 with SMTP id m110mr52326578qge.80.1410897585567; 
	Tue, 16 Sep 2014 12:59:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 16 Sep 2014 12:59:25 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF845CC50028@ALA-MBA.corp.ad.wrs.com>
References: <1410555811-30996-1-git-send-email-jslater@windriver.com>
	<CAMKF1spCXYs2OSUdjN4XCFLJsAX4iHHOQRzqEjEGf9uq7uZDFQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF845CC50028@ALA-MBA.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 20:59:25 +0100
Message-ID: <CAJTo0LZKOKaZeOKFGUpCyAtkcLZ9iGus6fGV_X_1ih8CpuwtAg@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: add aarch64 support
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
X-List-Received-Date: Tue, 16 Sep 2014 19:59:51 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2014 20:27, Slater, Joseph <joe.slater@windriver.com> wrote:
> It is not runtime tested.  The intent is to allow world builds for aarch64.

In that case would it be more suitable to use COMPATIBLE_* to exclude
aarch64 until it is tested?

Ross

