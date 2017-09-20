Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id DD0A460766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 19:14:20 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id d70so3708454qkc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 12:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=mtwq/6jBIkQHtZBoxGYUuaitZbYSiObZOkplF/kfkbc=;
	b=XUMiJtGwTCRN07VctArwip1dkT5FgniGB8WueWUxw8cmKR5I9Z4hO+yRk2AMEFGTIs
	f3BquryUBMmqwsVfRIKEQS7KWw/IsgqQifklkaz1PD4mDz4LCtpXPBZ2XXhCl4kLmAc+
	ZwHQPZxaknoD9DGu7YwKFLDLZwbsirCjAE1K4e4bQI6Guh9Z80+2c28r13velHPfR8U/
	9RfnaFvrivBZJuKUfnVKVW6gdHlPAJyUmvnMTVhoTsyYm1Hdd1yDiwY5Qqd622gRk1YF
	o+Blw2feKt4BdYr8xkttLmI7Q9FZO1yX/WtkKPmH7gBvgWxAr6gG8V2AlCvk93DuAqYR
	1Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mtwq/6jBIkQHtZBoxGYUuaitZbYSiObZOkplF/kfkbc=;
	b=PBGrgs4EQcPTsR9hsTIN+H1SE+KvDsqTwUjiO8iDDrgTxCyfrAvKVTNRp5Z1o7BKBt
	DvGBMIMNMzT6itX/atiJpHbPkHEwB8QmBaTe3mheQWrs9BA3z7sYKp6igHhS/A17TscE
	xKk1c7+JvfypfgVErSZrTf+Q3Vbgse6dVQiGM79/OdkYrT5yF3EZyyV0Hpu1qYxmlhei
	8kU1n9ETYlPOa4SAoj3hQJMI2fCszFEukjSJnBl8ddDsRTtp4kpjCRR+YhI+qY7CeWPV
	OTm2RwubpS7JhMWMC+IwPargf9RqZRVwmbM2tUk4TmV+WHZQgVICxfZtMVI+7UzHF9ti
	M8MQ==
X-Gm-Message-State: AHPjjUi1vlA8/7DHEpxsll92A9+oQxdIVjJMSMqObJmpY0gUDuKxtyCH
	DI6ikwe+vX8OYrEX1ra0NM5KBQ==
X-Google-Smtp-Source: AOwi7QCDXrvhBDWrZgntYivkx/UjQsmr6rlpMHMnVmsXvUrg9j3ovzEVwcgD/bqOfPJY16P4xWz2OA==
X-Received: by 10.233.237.7 with SMTP id c7mr9029397qkg.69.1505934861612;
	Wed, 20 Sep 2017 12:14:21 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	m18sm1784830qtb.77.2017.09.20.12.14.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 12:14:21 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170908143315.30326-1-pkj@axis.com>
	<d1f3c690a4cc49adb978f14fb5033ae8@XBOX02.axis.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b566a55a-ea26-a764-dd2a-8e14e68c3741@gmail.com>
Date: Wed, 20 Sep 2017 12:14:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <d1f3c690a4cc49adb978f14fb5033ae8@XBOX02.axis.com>
Subject: Re: [pyro][PATCHv2] oe-pkgdata-util: package-info: Allow extra variables to be displayed
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
X-List-Received-Date: Wed, 20 Sep 2017 19:14:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Peter


On 09/20/2017 09:07 AM, Peter Kjellerstedt wrote:
> Is there any chance of this making it into 2.3.2?=20
2.3.2 is in QA so it may not. This does not mean it wont end up in morty.=


I am stagging the change now.

thanks for the reminder.
Armin
> It seems 2.3.2 is=20
> not too far away, given that the DISTRO_VERSION has been updated to=20
> 2.3.2 on the pyro branch, but I do not know what the current status=20
> is or when you expect to cut the release.
>
> For the record this should be safe to take regarding any QA testing=20
> done since it only affects a script that is not used as part of=20
> building anything, and then only changes its behavior if a new=20
> argument is specified.
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=

>> Peter Kjellerstedt
>> Sent: den 8 september 2017 16:33
>> To: Armin Kuster <akuster808@gmail.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: [OE-core] [pyro][PATCHv2] oe-pkgdata-util: package-info: Allo=
w
>> extra variables to be displayed
>>
>> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>
>> By specifying the -e <var> option one or multiple times, extra
>> variables available in the pkgdata can be displayed, e.,g,
>> `oe-pkgdata-util package-info -e SUMMARY -e LICENSE ...`. The extra
>> variables displayed are quoted since some of them may contain
>> whitespace.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>
>> This is a backport of the corresponding change (6f054fcf) on master.
>> It should not change anything unless one actually uses the --extra
>> option to oe-pkgdata-util.
>>
>> PATCHv2: Now without Change-Id footer.
>>
>>  scripts/oe-pkgdata-util | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
>> index 6255662a4b..677effeef6 100755
>> --- a/scripts/oe-pkgdata-util
>> +++ b/scripts/oe-pkgdata-util
>> @@ -325,8 +325,15 @@ def package_info(args):
>>              recipe_version =3D recipe_version + "-" +
>> mappings[pkg]['PR']
>>          pkg_size =3D mappings[pkg]['PKGSIZE']
>>
>> -        items.append("%s %s %s %s %s" %
>> -                     (pkg, pkg_version, recipe, recipe_version,
>> pkg_size))
>> +        line =3D "%s %s %s %s %s" % (pkg, pkg_version, recipe,
>> recipe_version, pkg_size)
>> +
>> +        if args.extra:
>> +            for var in args.extra:
>> +                val =3D mappings[pkg][var].strip()
>> +                val =3D re.sub(r'\s+', ' ', val)
>> +                line +=3D ' "%s"' % val
>> +
>> +        items.append(line)
>>      print('\n'.join(items))
>>
>>  def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
>> @@ -530,6 +537,7 @@ def main():
>>                                            description=3D'Looks up the=

>> specified runtime package(s) and display information')
>>      parser_package_info.add_argument('pkg', nargs=3D'*', help=3D'Runt=
ime
>> package name to look up')
>>      parser_package_info.add_argument('-f', '--file', help=3D'Read
>> package names from the specified file (one per line, first field
>> only)')
>> +    parser_package_info.add_argument('-e', '--extra', help=3D'Extra
>> variables to display, e.g., LICENSE (can be specified multiple times)'=
,
>> action=3D'append')
>>      parser_package_info.set_defaults(func=3Dpackage_info)
>>
>>      parser_find_path =3D subparsers.add_parser('find-path',
>> --
>> 2.12.0
> //Peter



