Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D06C76D545
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 23:32:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h3so1991198pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 15:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jIIwEa8tEDXt9+lytXVP7mUfH89y8z+J5J/MNqKUpWA=;
	b=Ktk2+0Ao1E8s0IGC9P1YCHQBNdMa399qWVubwwsixw9yEnMYWdDz5CDJcFpSH6s07C
	Z+g5H6xd9ef6GeGJq1F7qGB35BtYBOHKvSHOsCLXTrsUKW1SEfKlfqgc3TVS4syvE5XA
	Nc+1z8Onp1eekCeEIU+JzIVQvdyltfGmIK5RngvBvoJqmSfCPkNU2Y4smjHf/t2nP6zJ
	9lAmj2hD03Ctk5kd3Ib5IqB9wO91qzE8nv7CBENecYJR8EWmYbkBj3vjYCvWIS8aI86C
	451dD/b6LhNRQDAZ4VLwLlv+o8ijV96/Serncj8Bby6pbBRSsyYl27Ne0ZH+N5YE6Mtb
	62/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=jIIwEa8tEDXt9+lytXVP7mUfH89y8z+J5J/MNqKUpWA=;
	b=WqkaawoctaGUg9AsSRznHPzCa02+Xb6qIQk94vBFOzzbyqqUa3OFSPaF95sxfiQeI2
	97UA+iZ6MUjWswBWiJgUwfpjqJYh5D+GCGZ9le7tbTbNbM9ldZ36JF2CpC2qFxObmfRz
	3lrGcFQIQss1sohyKAmf15x4jR53fkhGZdQgycPCcQNPfp3yEgIhH68EEBCxocQ+SvqY
	Z9+obD2IICyDpY9HAOzZ0lASWXiIhYXKKJdX7MKiJaFQ0UyP3fXzvQP/wO/OhmJvA/L0
	Q+kucB6dEem9YI5i8daOXgZo2rdM+x2b5rZqAN3v3JAtPfRNSxhuZf3Nsf+9hu5RkuNn
	ySiA==
X-Gm-Message-State: AJcUukemIa1NJ9lxvUKrkDc9WscSpLX9D7gYDVJi07tOHy+tAHUry5wz
	J9beMQquKt+f+J4IAj+BQC+TZKERyK4=
X-Google-Smtp-Source: ALg8bN54J0rGVFWcSBMdwmrvpW/tCLfhzU20TVacf/UT4oO6zyYF01INvwYw5QvKGm2y7lEqKQrGiA==
X-Received: by 2002:a63:5a08:: with SMTP id o8mr3770514pgb.185.1548286339656; 
	Wed, 23 Jan 2019 15:32:19 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:bc04:9332:d657:8202?
	([2601:202:4180:c33:bc04:9332:d657:8202])
	by smtp.gmail.com with ESMTPSA id
	a195sm38410788pfa.7.2019.01.23.15.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:32:18 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-10-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0dc855c4-45e8-f642-30a8-778dbb2772d5@gmail.com>
Date: Wed, 23 Jan 2019 15:31:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190123161744.45763-10-alex.kanavin@gmail.com>
Subject: Re: [PATCH 10/10] devtool: add a command to print an overall list of recipes that can be updated
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
X-List-Received-Date: Wed, 23 Jan 2019 23:32:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/23/19 8:17 AM, Alexander Kanavin wrote:
> A sample portion of the output:
>
> $ devtool check-upgrade-status
> ...
> NOTE: acpid                     2.0.30          2.0.31          Ross Burton <ross.burton@intel.com>
> NOTE: u-boot-fw-utils           2018.11         2019.01         Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
> NOTE: u-boot-tools              2018.11         2019.01         Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
> NOTE: u-boot                    2018.11         2019.01         Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
> NOTE: bind                      9.11.5          9.13.5          Armin Kuster <akuster808@gmail.com>  cannot be updated due to: 9.11 is LTS 2021
> NOTE: iproute2                  4.19.0          4.20.0          Changhyeok Bae <changhyeok.bae@lge.com>
> NOTE: ofono                     1.25            1.27            Ross Burton <ross.burton@intel.com>
> NOTE: wpa-supplicant            2.6             2.7             Changhyeok Bae <changhyeok.bae@lge.com>
> NOTE: base-passwd               3.5.29          3.5.45          Anuj Mittal <anuj.mittal@intel.com>  cannot be updated due to: Version 3.5.38 requires cdebconf for update-passwd utility
> NOTE: busybox                   1.29.2          1.30.0          Andrej Valek <andrej.valek@siemens.com>
> NOTE: dbus-test                 1.12.10         1.12.12         Chen Qi <Qi.Chen@windriver.com>
> NOTE: dbus                      1.12.10         1.12.12         Chen Qi <Qi.Chen@windriver.com>
> NOTE: glib-2.0                  2.58.0          2.58.3          Anuj Mittal <anuj.mittal@intel.com>
> NOTE: glib-networking           2.54.1          2.58.0          Anuj Mittal <anuj.mittal@intel.com>

this looks great.

thanks.

- armin
> ...
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  scripts/lib/devtool/upgrade.py | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
> index 202007793b2..42a4c0e4bff 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -600,6 +600,20 @@ def latest_version(args, config, basepath, workspace):
>          tinfoil.shutdown()
>      return 0
>  
> +def check_upgrade_status(args, config, basepath, workspace):
> +    if not args.recipe:
> +        logger.info("Checking the upstream status for all recipes may take a few minutes")
> +    results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
> +    for result in results:
> +        # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
> +        if result[1] != 'MATCH':
> +            logger.info("{:25} {:15} {:15} {} {} {}".format(   result[0],
> +                                                               result[2],
> +                                                               result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
> +                                                               result[4],
> +                                                               result[5] if result[5] != 'N/A' else "",
> +                                                               "cannot be updated due to: %s" %(result[6]) if result[6] else ""))
> +
>  def register_commands(subparsers, context):
>      """Register devtool subcommands from this plugin"""
>  
> @@ -627,3 +641,9 @@ def register_commands(subparsers, context):
>                                                    group='info')
>      parser_latest_version.add_argument('recipename', help='Name of recipe to query (just name - no version, path or extension)')
>      parser_latest_version.set_defaults(func=latest_version)
> +
> +    parser_check_upgrade_status = subparsers.add_parser('check-upgrade-status', help="Report upgradability for multiple (or all) recipes",
> +                                                        description="Prints a table of recipes together with versions currently provided by recipes, and latest upstream versions, when there is a later version available",
> +                                                        group='info')
> +    parser_check_upgrade_status.add_argument('recipe', help='Name of the recipe to report (omit to report upgrade info for all recipes)', nargs='*')
> +    parser_check_upgrade_status.set_defaults(func=check_upgrade_status)


