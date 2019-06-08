Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 82D9F6D230
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 12:15:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v19so4209588wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2019 05:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Uahit3lbB4jwn6TIoWqUnmivDsAcY0FEtliT9b3+nqI=;
	b=Evibsi+m/9ZE+vpfPI02mU+WMYEqbMfHJ9FcM2xNDiRajTarSSHxgOrfVz+VtI2G/A
	c2vXj8UZCgH+NZAyJNW0QNJ0QAzDrnowRnakn/5tSY0/xfCaUuodnT6773q43mPTK+dE
	w85Euw+VB7UiUoCWZE6FumouVzLABY51roKqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Uahit3lbB4jwn6TIoWqUnmivDsAcY0FEtliT9b3+nqI=;
	b=E2Bqz5R3fFFZSXJpm3IwjlVxo5tMGUV0FK3ast/ZFV/eFezRiUbpCjIMhpI0OuLxx8
	pZTPQj+VatHhfoGaQESnyd/4bogqspRosgXMGNv1IPa+VrebJ9lccXFvCg0sCNxkSszB
	myOYhPNL69Tm4GcVdOYuYpjvRzlbc/jWzkWKOW4QZY9WymoTTCw3t9DTyNvllTODqP0B
	D3taju6aovSgWdXgqff3EWPc4mytgz3DDr6LPQgy4xhmJY7+5Bfe5yl6dVl9KqbQ03/s
	xJrLIvVosLcuFGxF5u+hQCi/OgRNKjcSeouIppx7K8vA486b5A7q/buexA3z7IRbNGxX
	MkXw==
X-Gm-Message-State: APjAAAWcu1DvKogwIFthBzlI2oSqDaDdVcaMDyphs7xc/pI6XM8YToK8
	axdUwaYEv7/qTL7W84JBe1AxFw==
X-Google-Smtp-Source: APXvYqy+VDgUZqMlLI5mozRLmDjpr43sa/a+wCFnQTxdWG4rR1avmITGbOSRETXBTzAse2T4bYEIWA==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr6769333wmc.17.1559996111279; 
	Sat, 08 Jun 2019 05:15:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f204sm2371896wme.18.2019.06.08.05.15.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 08 Jun 2019 05:15:10 -0700 (PDT)
Message-ID: <75b09b73c57e0717cda78e6732e73d91ef670f45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jaewon Lee <jaewon.lee@xilinx.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Jun 2019 13:15:08 +0100
In-Reply-To: <1559945821-18316-1-git-send-email-jaewon.lee@xilinx.com>
References: <1559945821-18316-1-git-send-email-jaewon.lee@xilinx.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] devtool: build: add deploy to the tasks run for devtool build
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
X-List-Received-Date: Sat, 08 Jun 2019 12:15:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-07 at 15:17 -0700, Jaewon Lee wrote:
> Right now `devtool build` runs populate_sysroot and packagedata
> tasks.
> Adding deploy to this list so that the newly built artifacts are
> available in the deploy directory.
> 
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> 
> [YOCTO #13382]
> 
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> ---
>  scripts/lib/devtool/build.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/build.py
> b/scripts/lib/devtool/build.py
> index 7543398..aff5710 100644
> --- a/scripts/lib/devtool/build.py
> +++ b/scripts/lib/devtool/build.py
> @@ -37,7 +37,7 @@ def _set_file_values(fn, values):
>      return updated
>  
>  def _get_build_tasks(config):
> -    tasks = config.get('Build', 'build_task',
> 'populate_sysroot,packagedata').split(',')
> +    tasks = config.get('Build', 'build_task',
> 'deploy,populate_sysroot,packagedata').split(',')
>      return ['do_%s' % task.strip() for task in tasks]
>  
>  def build(args, config, basepath, workspace):

This frustrates me a bit.

The key question you have to ask here is "What happens for recipes that
don't have a do_deploy task?".

The answer is it breaks:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/506

*Please*, when sending devtool patches, test with:

oe-selftest -r devtool

Cheers,

Richard



