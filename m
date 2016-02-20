Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id F354D77136
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 19:17:01 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s5so43064227qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IHPPcnvmymSIE1CjV06ywvMSrIYI4GdmfRrmTmMMWe0=;
	b=KLQ2g1YxwotqLtBnC4avINCFANg2OYax4pUdTFXsjnU8l4gbOuxG6gwh+sPATSmTl6
	/Bl2fWN/c7czBdN1molhpDI+ENlQAUSOV7c6xOz202UlOI3JbFw/zGtfFecFVLgit06o
	mW7CS2j+r0aq3VJpcVO10xCpgQ/mPWcD9+ztLcT9+AcOJaCiOXyQD6zG4U9YIKwjiZLH
	nhtH6iG+OET7cORC0NDGQFJzWih/HjN5RqCDinJRNzJtpD/8Czak5YRncwBaqFzPn2C6
	R5wACP6WQAXXNsz9Ma+YkWZP1Y2JMmGNyjHqn+Ql5nk2hXyYqd6z9+jIUKbxYA9J6wpQ
	O/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IHPPcnvmymSIE1CjV06ywvMSrIYI4GdmfRrmTmMMWe0=;
	b=GKB0ww6bkSiJwkpkIP6SrbAecrMxzJkalg+BKPOspkxArXsixyjgD7drl9HVOBKQjA
	82zd7B7BOFIhA6PlmyqIvuMjotzwaU64orYt0hJI+Xohe6KwHtrFMlH4l4WuYMCRZdNh
	sYqkmTbM1nHQ/6TW85IAbwIr1gB4L0Xo+/TOuzkmE03jSVZc5P83/TCKp5mmBuxJSkpZ
	5rt9Xo6pYFbJWgFBWjrU69lBBVybKYivaWhbiO/ZgtgwS+lzzX6I+9ytVIMjnhaVEZ3T
	JZGRbb/ewCj21EK48MkQsV/ZFIqHq1uFDYElScfK7UOVoFOJ5PWmxtcb1AP3VYQ/3E/7
	DZag==
X-Gm-Message-State: AG10YOQtRpadee5PteXmCZij4eFnLoIKvaUcc+C9E86V+cvA653KFdrUHQwzjsG8x6dt7+3Dx/vYDkqBXW9QAw==
X-Received: by 10.55.74.197 with SMTP id x188mr24904917qka.104.1455995821834; 
	Sat, 20 Feb 2016 11:17:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 20 Feb 2016 11:16:32 -0800 (PST)
In-Reply-To: <988345efbaa22b1f8f3facef4a15f19b040e4e96.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
	<988345efbaa22b1f8f3facef4a15f19b040e4e96.1455874585.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Feb 2016 11:16:32 -0800
Message-ID: <CAMKF1sr8jXY-0SLSGfBOBeScMzpUHeQEK=jQNUKadmfBq__1ww@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/14] devtool: minor fix for error message
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
X-List-Received-Date: Sat, 20 Feb 2016 19:17:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 19, 2016 at 1:38 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> There is no -N/--name option for devtool, that's a recipetool option -
> with devtool you just specify the name as a positional argument.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index d12cc2e..590dfef 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -150,7 +150,7 @@ def add(args, config, basepath, workspace):
>              stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, tempdir, source, extracmdopts))
>          except bb.process.ExecutionError as e:
>              if e.exitcode == 15:
> -                raise DevtoolError('Unable to auto-determine name from source tree, please specify it with -N/--name')
> +                raise DevtoolError('Unable to auto-determine recipe name from source tree, please specify it on the command line')

may be reword it a bit to "Could not auto detect recipe name, please
specify on commandline"

>              else:
>                  raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

