Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id CBCB9606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:58:33 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id k90so25784243uak.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=oGURUgM8N+gVOt6Txp6wVbuMD4AznS/XWJXGWpNPVWE=;
	b=JH+9KJlmZSi5oOMWqQolifcgxfd2C109pJSEiHNYqE2WkGkPnyf7s+ifOqsoBmMs+g
	joyvS1YapXvq+0Hs1c15BuTccxToKGU5j9qBr1PeutMBeGeFmyM+VOFXnzOl/b7mq8dY
	/1XmzssdbH1/RXulOlqCWM1//q12764gTePQgY6CdowvBWShtTPFPxAAoYG4p2K1Pbl9
	BdAKruhS1cnc+S+H52d778WXb+rmIi+Mu5MkoR5QyO3E/3Dtp/TbACLJiDU14SHsp4c5
	zRQATlaLh3Jgr9Iot/xlHuBJmupZBFNCzR1/awkgVjPF0kVDeBo8tFPrdKdodEqFZUzE
	bkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=oGURUgM8N+gVOt6Txp6wVbuMD4AznS/XWJXGWpNPVWE=;
	b=gkSLmJZK11bP8egcPHUndMuujola87WEq7sSI6R7EeQnJ+DskomC9G97mM6Wc3Fcjh
	R0/Xr331hXyroIRcYYqmUL9BKFMnENFWmYq6ExoGIoLV6fpq0BVBPW+cwPAsaThURbKw
	gBRINYasdDmwKWHwBaF02I0dxnhNCe4S2sWPd8quoahWsjaVkgObnAsaEMO+lG3jbCZ9
	W377m5jEiIA47RxUkG0Y0+pG1CYMj0naQwBwkpNSEoHSTMo44WeFBa7wWhzn+NMzHa03
	PtWenrsiffSqo9QIdzkzvG4ocjk9AsvH/8Qk5RgwgRKKI+zziv3ln72e0H8skdy6Qar+
	M0yQ==
X-Gm-Message-State: AE9vXwNamNMZA0pySyYr84cNlVc3vaGh7maq19X2tYy4jQR6tqwj308aR/sdjBbBXJAp7Q==
X-Received: by 10.176.83.110 with SMTP id y43mr1431676uay.70.1472554713706;
	Tue, 30 Aug 2016 03:58:33 -0700 (PDT)
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com.
	[209.85.217.181]) by smtp.gmail.com with ESMTPSA id
	h184sm561536vkf.21.2016.08.30.03.58.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Aug 2016 03:58:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f181.google.com with SMTP id m60so25618088uam.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 03:58:32 -0700 (PDT)
X-Received: by 10.31.161.137 with SMTP id k131mr1683167vke.122.1472554711863; 
	Tue, 30 Aug 2016 03:58:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Tue, 30 Aug 2016 03:58:31 -0700 (PDT)
In-Reply-To: <20160830103536.GA3482@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
	<CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
	<20160830103536.GA3482@linux.intel.com>
Date: Tue, 30 Aug 2016 07:58:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqrhofQDSL9zfhJC6HFKbk0bxnDhoaaqbn6ooj-0jqX8Q@mail.gmail.com>
Message-ID: <CAP9ODKqrhofQDSL9zfhJC6HFKbk0bxnDhoaaqbn6ooj-0jqX8Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] Provide list of deployment artifacts
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
X-List-Received-Date: Tue, 30 Aug 2016 10:58:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 30, 2016 at 7:35 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Tue, Aug 30, 2016 at 07:21:20AM -0300, Otavio Salvador wrote:
>> On Tue, Aug 30, 2016 at 6:29 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> > Hi,
>> >
>> > This is a fix for Bug #9869 - Provide a per-target manifest of files which were, or would have been, produced
>> >
>> > The list of artifacts produced by deployment tasks (do_deploy, do_image_complete and do_populate_sdk[_ext] is
>> > obtained from sstate manifests and fired as a TaskArtifacts metadata event. This should allow Toaster to
>> > handle artifacts in simple way and remove a lot of current Toaster code doing guess work.
>> >
>> > To generate manifests for do_image_complete and do_populate_sdk they have been put under sstate control.
>> >
>> > To avoid storing big files(images and sdk installer) in sstate new variable SSTATE_SKIP_CREATION has been
>> > set in image.bbclass and populate_sdk_base.bbclass and sstate code was modified to avoid adding files
>> > to sstate if SSTATE_SKIP_CREATION is set.
>>
>> SKIP creation of what?
> SKIP creation of SSTATE entity.

I know but of WHAT?

SSTATE_SKIP_IMAGE_CREATION would be a clearer name for me.

>> Variable name seems a little vague for me. Even
>> needing the manifest, does it makes sense to store the image and SDK
>> on sstate?
> It doesn't and skipping this is a purpose of introducing SSTATE_SKIP_CREATION variable.

So it is always going to be skipped?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

