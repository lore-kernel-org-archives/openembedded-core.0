Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id A19E76C4F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 05:05:31 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id z17so9594412itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 22:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bCTlXogr2tiisWhBuQpQY3iwM1MNU+HIPCNCKwuH2c4=;
	b=Ey+AiB0+rkUcGprK9cO6QlzWuyHVgLnHoWWmUp6CDRU1w5+b6ocjjyoIB3+kWWuCuH
	aJUgTZWDUREinjF4O/lvEjeD2ArYelHonC6G4KpxJjyOht6tfBe+6ee8LhkEDzXoRHsX
	//chNnSCwQthCsHHqpf8038owiWeVgpNx/xPalWD9Wnu6YRUPlC+F2nWkfl6l1x7w+/e
	TYziWwjEx34bAd3zP9DY0bvjilcWnr/BVkV7ipXjtpGSFIAZ3ONgvejkKa4mKNnEbtp9
	IT7DJfk1jquo0dfbCQwXGL/qLEd9KaMe+XqUoVMeUXCNYXtzljzMuH6M0n8G1dXF32ZG
	rvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=bCTlXogr2tiisWhBuQpQY3iwM1MNU+HIPCNCKwuH2c4=;
	b=DcDiODPzO9ONGaa3zRCh6JesQfBtqTbPMXI6M3TJkaOI6kKZNYCLRrzqZH3cgQlwu9
	Ij/91rVBU3k6v4bkQsN0Ej5GhidavO6jVMbKv7WkYQyxPYBFp+j4v1r1qT3IymnSzsjR
	EuUEl9s426949takAJt5f6JIan6S8kDVKZvyh20BHgCvCJ08gjX+cZWVfMVvlhp0y7v/
	1EJcwbyyGUErCh6MVMin5rRXiqiMv4H5OhEgBnGup+x0m729PCdnbxT8M/Ic5JaXrnPz
	4wKW0XwhJ7teSl+VP3VK9bv+VJc3+v6GO9udAX+GAQGPuUjon6msux+UWXlM50+Tm03t
	A9Xw==
X-Gm-Message-State: APjAAAWDBAK3G3QPIaRoW16Zc2lPqch6VWp9+GDPLej5PqhiH6iUxcqF
	ZrOPYoDsumgXbYnUWQhO4tiqLOGF
X-Google-Smtp-Source: APXvYqx9Jxzupu1JTT+9aLwzBYGQaB67uUP1Pbrtd6r03V/uHqfmB14d+EHiVPBNZg01hAXD67V0eg==
X-Received: by 2002:a24:c544:: with SMTP id f65mr1438160itg.90.1555650332776; 
	Thu, 18 Apr 2019 22:05:32 -0700 (PDT)
Received: from [192.168.0.33] (75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	y16sm1379983ion.64.2019.04.18.22.05.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 22:05:32 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190419025718.15348-1-JPEWhacker@gmail.com>
	<20190419025718.15348-3-JPEWhacker@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <647cdc97-99f4-9ed2-9305-ad50b4a53c52@gmail.com>
Date: Thu, 18 Apr 2019 23:05:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190419025718.15348-3-JPEWhacker@gmail.com>
Subject: Re: [PATCH 2/2] resulttool: Add log subcommand
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
X-List-Received-Date: Fri, 19 Apr 2019 05:05:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/18/19 7:57 PM, Joshua Watt wrote:
> Adds a subcommand for dumping various logs from test results
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  scripts/lib/resulttool/log.py        | 56 ++++++++++++++++++++++++++++=

>  scripts/lib/resulttool/regression.py |  2 +-
>  scripts/resulttool                   |  2 +
>  3 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/lib/resulttool/log.py
>
> diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log=
=2Epy
> new file mode 100644
> index 00000000000..5584f2d0a99
> --- /dev/null
> +++ b/scripts/lib/resulttool/log.py
> @@ -0,0 +1,56 @@
> +# resulttool - Show logs
> +#
> +# Copyright (c) 2019 Garmin International
> +#
> +# This program is free software; you can redistribute it and/or modify=
 it
> +# under the terms and conditions of the GNU General Public License,
> +# version 2, as published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope it will be useful, but WITHO=
UT
> +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
> +# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
> +# more details.
> +#
> +import resulttool.resultutils as resultutils
> +
> +def show_ptest(result, ptest, logger):
> +    if 'ptestresult.sections' in result:
> +        if ptest in result['ptestresult.sections'] and 'log' in result=
['ptestresult.sections'][ptest]:
> +            print(result['ptestresult.sections'][ptest]['log'])
> +            return 0
> +
> +    print("ptest '%s' not found" % ptest)
> +    return 1
> +
> +def log(args, logger):
> +    results =3D resultutils.load_resultsdata(args.source)
> +    for path in results:
> +        for res in results[path]:
> +            if 'result' not in results[path][res]:
> +                continue
> +            r =3D results[path][res]['result']
> +
> +            if args.raw:
> +                if 'ptestresult.rawlogs' in r:
> +                    print(r['ptestresult.rawlogs']['log'])
> +                else:
> +                    print('Raw logs not found')
> +                    return 1
> +
> +            for ptest in args.ptest:
> +                if not show_ptest(r, ptest, logger):
> +                    return 1
> +
> +def register_commands(subparsers):
> +    """Register subcommands from this plugin"""
> +    parser =3D subparsers.add_parser('log', help=3D'show logs',
> +                                         description=3D'show the logs =
from test results',
> +                                         group=3D'analysis')
> +    parser.set_defaults(func=3Dlog)
> +    parser.add_argument('source',
> +            help=3D'the results file/directory/URL to import')
> +    parser.add_argument('--ptest', action=3D'append', default=3D[],
> +            help=3D'show logs for a ptest')
> +    parser.add_argument('--raw', action=3D'store_true',
> +            help=3D'show raw logs')
> +
> diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resultt=
ool/regression.py
> index aecb9da9ce5..fa90ab1e522 100644
> --- a/scripts/lib/resulttool/regression.py
> +++ b/scripts/lib/resulttool/regression.py
> @@ -64,7 +64,7 @@ def regression_common(args, logger, base_results, tar=
get_results):
>          if a in target_results:
>              base =3D list(base_results[a].keys())
>              target =3D list(target_results[a].keys())
> -            # We may have multiple base/targets which are for differen=
t configurations. Start by=20
> +            # We may have multiple base/targets which are for differen=
t configurations. Start by
This change looks the same to me so what am I missing?

- Armin
>              # removing any pairs which match
>              for c in base.copy():
>                  for b in target.copy():
> diff --git a/scripts/resulttool b/scripts/resulttool
> index 18ac1019236..9477667a870 100755
> --- a/scripts/resulttool
> +++ b/scripts/resulttool
> @@ -49,6 +49,7 @@ import resulttool.store
>  import resulttool.regression
>  import resulttool.report
>  import resulttool.manualexecution
> +import resulttool.log
>  logger =3D scriptutils.logger_create('resulttool')
> =20
>  def main():
> @@ -66,6 +67,7 @@ def main():
>      subparsers.add_subparser_group('analysis', 'analysis', 100)
>      resulttool.regression.register_commands(subparsers)
>      resulttool.report.register_commands(subparsers)
> +    resulttool.log.register_commands(subparsers)
> =20
>      args =3D parser.parse_args()
>      if args.debug:



