Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6C1761C32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:12:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 25so5190923wmk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=P6Gx+SIHdhf8i9XBRfnFeOZJgkn/jbSYugUPPxs9gaA=;
	b=b0ZVmqVHmxUuogkES5I7biaN0bpk6WfU2NacmgK3bYJDB9Zmk8REM8EkdJEMDq6J6n
	No8g1xKOj8jyceVb23VUG/mhk6KZp1sjATxBga9c2XxAv3Pz3ELm0iDdHVBZcCsXgzFG
	Sf7iKKzELMiSFxqHkWoa0DQQ8axSnWYrR5nn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=P6Gx+SIHdhf8i9XBRfnFeOZJgkn/jbSYugUPPxs9gaA=;
	b=CxRdljhsmxKwCPfms7PA5HGeTE2t+Zf5ECy5K9bYLKLJYBypbNMfHITLDCQHy+jSVu
	B8qYCNDfenWpsQy9jMoy+xftulSyBnsCZEFQbWf8TLKoxm7d96eLF5+g4gG6bXKit9y2
	ervlnoe+WCmVFU759TN5PNyjmS0vybDYQV5Bze95Ti71yzEoPmmdGg4glnlAixMRWMz3
	2dsnras334wnz+M9sPecRf84HDRKSTMyYjVj60bm1yXPOdtgNlrpEyP1zCPj0EMFje4n
	PgbwFrNn1izhBQNEZTgu8NY1cnmaVuMNbT1Fn4/E7pGpJClRtKxroa301BCmCn7QA/KO
	vA2w==
X-Gm-Message-State: ANhLgQ02jm/hPt2Az3A9U+cYlRcasdy3V3//O7oIz6ci7zeaFaJx/QSX
	vP9y9WHIGy7zIWdQG3+2V9oi2/XNGEk=
X-Google-Smtp-Source: ADFU+vsZVmzqUIuzImAzfHwJCviRn+ScdehU9Jof7+/OLHAfN32znaVU+JxfAmcO4Ny5XoJHRgXbzw==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr3635072wmi.149.1584004330237; 
	Thu, 12 Mar 2020 02:12:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x17sm35415988wrt.31.2020.03.12.02.12.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 02:12:09 -0700 (PDT)
Message-ID: <e378ba2ada9b6f5ac5183b947c8dc637548bdebf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Kral <sk@typedivision.de>, openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 09:12:08 +0000
In-Reply-To: <20200311163730.78078-1-sk@typedivision.de>
References: <20200311163730.78078-1-sk@typedivision.de>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Thu, 12 Mar 2020 09:12:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 17:37 +0100, Stefan Kral wrote:
> Add the option --json-result-dir to oeqa core context to enable
> testresults.json creation for test runs via testexport.
> 
> Eg. oe-test runtime --json-result-dir .
> 
> Signed-off-by: Stefan Kral <sk@typedivision.de>
> ---
>  meta/lib/oeqa/core/context.py | 30 +++++++++++++++++++++++++++++-
>  meta/lib/oeqa/core/runner.py  | 13 ++++++++++---
>  2 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
> index 16320af115..b9a28ce319 100644
> --- a/meta/lib/oeqa/core/context.py
> +++ b/meta/lib/oeqa/core/context.py
> @@ -116,6 +116,9 @@ class OETestContextExecutor(object):
>                  default=self.default_output_log,
>                  help="results output log, default: %s" % self.default_output_log)
>  
> +        self.parser.add_argument('--json-result-dir', action='store',
> +                help="json result output dir, create testresults.json here if set")
> +
>          group = self.parser.add_mutually_exclusive_group()
>          group.add_argument('--run-tests', action='store', nargs='+',
>                  default=self.default_tests,
> @@ -178,6 +181,22 @@ class OETestContextExecutor(object):
>  
>          self.module_paths = args.CASES_PATHS
>  
> +    def _get_json_result_dir(self, args):
> +        return args.json_result_dir
> +
> +    def _get_configuration(self):
> +        td = self.tc_kwargs['init']['td']
> +        configuration = {'TEST_TYPE': self.name,
> +                        'MACHINE': td.get("MACHINE"),
> +                        'DISTRO': td.get("DISTRO"),
> +                        'IMAGE_BASENAME': td.get("IMAGE_BASENAME"),
> +                        'DATETIME': td.get("DATETIME")}
> +        return configuration
> +
> +    def _get_result_id(self, configuration):
> +        return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'],
> +                                configuration['MACHINE'], configuration['DATETIME'])
> +
>      def _pre_run(self):
>          pass
>  
> @@ -196,7 +215,16 @@ class OETestContextExecutor(object):
>          else:
>              self._pre_run()
>              rc = self.tc.runTests(**self.tc_kwargs['run'])
> -            rc.logDetails()
> +
> +            json_result_dir = self._get_json_result_dir(args)
> +            if json_result_dir:
> +                configuration = self._get_configuration()
> +                rc.logDetails(json_result_dir,
> +                              configuration,
> +                              self._get_result_id(configuration))
> +            else:
> +                rc.logDetails()
> +
>              rc.logSummary(self.name)
>  
>          output_link = os.path.join(os.path.dirname(args.output_log),
> diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
> index f656e1a9c5..fc3872aa73 100644
> --- a/meta/lib/oeqa/core/runner.py
> +++ b/meta/lib/oeqa/core/runner.py
> @@ -319,10 +319,17 @@ class OETestResultJSONHelper(object):
>              the_file.write(file_content)
>  
>      def dump_testresult_file(self, write_dir, configuration, result_id, test_result):
> -        bb.utils.mkdirhier(write_dir)
> -        lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
> +        try:
> +            import bb
> +            has_bb = True
> +            lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
> +            bb.utils.mkdirhier(write_dir, exist_ok=True)

This threw errors under testing since mkdirhier doesn't have an
exist_ok parameter. The ordering is also reversed, we should mkdir,
then lock.

> +        except ImportError:
> +            has_bb = False
> +            os.makedirs(write_dir)

I suspect the parameter was meant to go here. 

I've added a fix to -next for this.

Cheers,

Richard


