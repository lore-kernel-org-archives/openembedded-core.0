Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 76BCB74E98
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 15:12:36 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id 15-v6so12985526pge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jun 2018 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+AB1j0d3BQRTxeZhhpKulv11HZcOtfVqsP4o7g95rUw=;
	b=fmtOQdUwz82K0GUAGKegtxt8BnJOCnr4mv6iUhZ5OuKo1F821MMNX/ZDm3rKLm/lzA
	r6UIttVHLZz4BB80Dq+kuEtKGfJlGl23lc+PKaDWd/Bo3UTOiJ31kC1esQ61UTzC58Ia
	TCi7re2DVTIOoTsNGz7JG0yV4+uv1Iap52a9rsfN4LhUMOo4WARok3MD6wuRERsKklKq
	HbLieT6s/T4Wyi9hvRzmDYprTs0Hax5qyEwHbHGejccQajEno8dO3We8ORMfLxb2k1i3
	YE+sXTiWUtBncEU+ncEnOTa7id7P0KIXxqyWZFapSSRGemanspwbFFQr9lY78nfzQHe2
	EM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+AB1j0d3BQRTxeZhhpKulv11HZcOtfVqsP4o7g95rUw=;
	b=RPH9WAajDD8r1fxMh53RV+sWPyE104M86shjMS9dOntjXIQBgPhcGucdSdPnqXFl6V
	V0vJtBQceakDZER8kIGdCE3pPwEGWfyjZx9mmrhtOrobfZUqGsnuJlrWAsrsm/mwRMPO
	u1FqgNbUwRRS4PzAJJPTq3V3pdJ0oEMSRInXREkCZiyRL0Hek8BNj8MI4lj0TyS/A31s
	D0fqCO61qPWtfZ1cz7+AiNyzY8U8DO7dCLSV4Iajlb1ryJBIkJvMVqoyG6iC/nBc3Nsi
	2aoEVJj6b+Cx6cZ8ahms6scLpuGJyV4H0Vj3NYa1htm31ZHo8OskX2Gf/AUXO7hs02mx
	XZAQ==
X-Gm-Message-State: ALKqPweGdNpStlQUleO125JJepITy+N5pQnsYfon7CCKaRRIFkEtrMa/
	P//jvWkDV3vQ3ILSYoyqXKvRrw==
X-Google-Smtp-Source: ADUXVKIduvxGlxlGHmCvbRonENBYWO7c4TYjbwOwHjzpejLCp+ImWLVZVFx1dLiKiBUYhyD8ph1NMw==
X-Received: by 2002:aa7:8201:: with SMTP id
	k1-v6mr17874005pfi.97.1528038757429; 
	Sun, 03 Jun 2018 08:12:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:f1bd:c539:22b:bbf1?
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	g8-v6sm63957798pgc.0.2018.06.03.08.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Jun 2018 08:12:36 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <058532a438814db98ab5389758a226fd@XBOX02.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <11df0453-3c35-b868-6d96-b23bd675ae9a@gmail.com>
Date: Sun, 3 Jun 2018 08:12:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <058532a438814db98ab5389758a226fd@XBOX02.axis.com>
Subject: Re: Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
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
X-List-Received-Date: Sun, 03 Jun 2018 15:12:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/02/2018 12:48 PM, Peter Kjellerstedt wrote:
> These two patches, in addition to "oe-pkgdata-util: lookup-recipe, 
> package-info: Don't finish prematurely" (commit 32c2a2dd) that is already 
> on master, need to be cherry-picked to the sumo branch as well. Without 
> them, `oe-pkgdata-util package-info ...` is more or less broken.
>
> //Peter
Thanks peter. I hope to remember to back port them once they hit master.

-armin
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Peter Kjellerstedt
>> Sent: den 2 juni 2018 21:31
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCHv2 1/2] oe-pkgdata-util: Make
>> parse_pkgdatafile() support package suffixed vars
>>
>> Support for variables suffixed with package names, e.g., PKGV_foo, was
>> removed in commit 3d2c87c4, which broke support for recipes that set
>> other versions on their packages than what is in ${PV}.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>>  scripts/oe-pkgdata-util | 46 ++++++++++++++++++-----------------------
>> -----
>>  1 file changed, 18 insertions(+), 28 deletions(-)
>>
>> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
>> index aea8a57516..965f473725 100755
>> --- a/scripts/oe-pkgdata-util
>> +++ b/scripts/oe-pkgdata-util
>> @@ -286,36 +286,26 @@ def lookup_recipe(args):
>>
>>  def package_info(args):
>>      def parse_pkgdatafile(pkgdatafile):
>> +        vars = ['PKGV', 'PKGE', 'PKGR', 'PN', 'PV', 'PE', 'PR',
>> 'PKGSIZE']
>>          with open(pkgdatafile, 'r') as f:
>> -            pkge = ''
>> -            pkgr = ''
>> -            pe = ''
>> -            pr = ''
>> +            vals = dict()
>>              for line in f:
>> -                if line.startswith('PKGV:'):
>> -                    pkg_version = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PKGE:'):
>> -                    pkge = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PKGR:'):
>> -                    pkgr = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PN:'):
>> -                    recipe = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PV:'):
>> -                    recipe_version = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PE:'):
>> -                    pe = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PR:'):
>> -                    pr = line.split(':', 1)[1].strip()
>> -                elif line.startswith('PKGSIZE'):
>> -                    pkg_size = line.split(':', 1)[1].strip()
>> -            if pkge:
>> -                pkg_version = pkge + ":" + pkg_version
>> -            if pkgr:
>> -                pkg_version = pkg_version + "-" + pkgr
>> -            if pe:
>> -                recipe_version = pe + ":" + recipe_version
>> -            if pr:
>> -                recipe_version = recipe_version + "-" + pr
>> +                for var in vars:
>> +                    m = re.match(var + '(?:_\S+)?:\s*(.+?)\s*$', line)
>> +                    if m:
>> +                        vals[var] = m.group(1)
>> +            pkg_version = vals['PKGV'] or ''
>> +            recipe = vals['PN'] or ''
>> +            recipe_version = vals['PV'] or ''
>> +            pkg_size = vals['PKGSIZE'] or ''
>> +            if 'PKGE' in vals:
>> +                pkg_version = vals['PKGE'] + ":" + pkg_version
>> +            if 'PKGR' in vals:
>> +                pkg_version = pkg_version + "-" + vals['PKGR']
>> +            if 'PE' in vals:
>> +                recipe_version = vals['PE'] + ":" + recipe_version
>> +            if 'PR' in vals:
>> +                recipe_version = recipe_version + "-" + vals['PR']
>>              print("%s %s %s %s %s" % (pkg, pkg_version, recipe,
>> recipe_version, pkg_size))
>>
>>      # Handle both multiple arguments and multiple values within an arg
>> (old syntax)
>> --
>> 2.12.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


