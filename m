Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 850AA7404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:27:05 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so35803488qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 15:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kljJmQ0dsppUtnJSxUE70K2TCl9FBiok9DK8oBN1OnA=;
	b=a9asHmbMliSX0CYwcRXygiYLFKsb8Fd/LQkXOblqwKUMsLbyu7Dnkz095g7f9kv86a
	dLM3GLhA/Hq5AbiDlQtVAKbELZYWLajT4gRfqGhkImxBfO9UsxYlzdb3SNvTWPFXmsbO
	iJNLqqLSthnqRgQMZ5409E410GBMwrTMjsMGsh7aUXwIdvSsiMTWZRXDh5kfv/36GLkH
	ga6IwodJKEJZCSDE8MGeSZryhWVWAmFStKFCJTMKslUl2FD2IWzPCdUV7t9PJO+wARme
	DekT0oUMeP7cDbkdzTKuL7IasQh+U+BJy9ptV4p1xcKgBLVxYaNJDQwSaEYbiKQ/enz4
	xtQA==
X-Gm-Message-State: ALoCoQmB54c30ew0LiPVxVgnjAWHffWaBxUvoagrr9GZGg5LwR1ygJ675gi6JNSBDzy7dT1tPFEC
X-Received: by 10.55.214.70 with SMTP id t67mr2527595qki.61.1443133625331;
	Thu, 24 Sep 2015 15:27:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Thu, 24 Sep 2015 15:26:45 -0700 (PDT)
In-Reply-To: <CAJTo0LZdyUDn-pmDAKL7OaQKpwiz=m1Z4WsV7WdaTvjX3oPD9g@mail.gmail.com>
References: <1443116526-16989-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAP71Wjz0zd_gTE8J82P0bvxvqSb_iH2CkK5jy=sGUGjKk_dGSQ@mail.gmail.com>
	<CAJTo0LZdyUDn-pmDAKL7OaQKpwiz=m1Z4WsV7WdaTvjX3oPD9g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 24 Sep 2015 15:26:45 -0700
Message-ID: <CAP71Wjxwp7DqZxB+_BTZ-3uQ-runJvA-XkWDZKFTMMZw0xm9Qw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: change glimagesink rank to marginal
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
X-List-Received-Date: Thu, 24 Sep 2015 22:27:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 24, 2015 at 1:19 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Does your platform support Xvideo?  If not then glimagesink will likely be
> picked anyway.

no, it doesn't. i will give this a try, but not before next week.

