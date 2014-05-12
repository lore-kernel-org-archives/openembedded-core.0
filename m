Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (unknown [209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id E5FCA60173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 15:06:20 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q107so7861953qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 08:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wF48jKe2UKzdOd0EE/SjK6EGsSPegJgcMXb52kWauFg=;
	b=lh0OQ5ytm0KvqKC2QDjdXMfyIBAQcqz3/60/f7o3qobpmEomPEqpN1MxI2xy4j5sx7
	Lvul8s1Ll2/Zqgp6c4o/BRL1bUfKtGya5hRudt9AExp8/59m29TCj+WPsDoWRYcAK/wa
	dcFSW+agafipKKeRYq2sdlXYunZy1PN46nmu6fhKqNgSTBaXr9gLwTaeoZGrMlATQrMu
	d3eoxFikwc43d0c4DXqAjf+AI/B0Aya4gkQw81hzeyraeSGSBB+G7DMR9aBJbj/+jYSY
	ubf3hAEklwp6oI1ckNNhIJWGRf43fz8wMFgQ3/AALaBUT6O6Z6VOqFu6bc0xEv+BTeey
	ITAQ==
X-Gm-Message-State: ALoCoQkmoA0o8aTgRtJqIELdFx1CrFhUvsd79L4iL7h72s4TII3KY6qOxz2ujHLij2luWl149pix
X-Received: by 10.224.160.142 with SMTP id n14mr39359822qax.17.1399907181787; 
	Mon, 12 May 2014 08:06:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Mon, 12 May 2014 08:06:01 -0700 (PDT)
In-Reply-To: <F9CF7C25-EA6B-4177-B269-C20B1E9CB608@moseleynet.net>
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
	<CAMKF1srGS73dbGsRC3hw6Aewn7aHp0JokEFisy=vRy4WBmmSCQ@mail.gmail.com>
	<F9CF7C25-EA6B-4177-B269-C20B1E9CB608@moseleynet.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 May 2014 16:06:01 +0100
Message-ID: <CAJTo0LaAGmOjHVkB-ywEzasD0WOttBmWpRwhzy=cSux3T5ZLEQ@mail.gmail.com>
To: Drew Moseley <drew@moseleynet.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
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
X-List-Received-Date: Mon, 12 May 2014 15:06:29 -0000
Content-Type: text/plain; charset=UTF-8

On 12 May 2014 15:40, Drew Moseley <drew@moseleynet.net> wrote:
>> should this be libdir instead ?
>
> I don't believe so.  This is used at compile time to locate the libraries and header files.  However forcing it here to be the libdir is clearly not correct even though it doesn't seem to break the build.
>
> I'll continue investigating and see if I can find a better solution.

For configure-time detection of libraries STAGING_LIBDIR is correct.

Ross

