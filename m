Return-Path: <jdmason@kudzu.us>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 008757DADF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 17:05:20 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id s3so5273964itk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nH0YbneI7d8YLRIU2acvndT+kijTrW+bFhEMzDRn5UU=;
	b=yb3IiGE7IfZghhdI6RA9TArm2Ah/z8aCKhhgq3Bn67WZBZR0o3FZE4hN6PvmdOsF89
	FEf0M+dqwgbXuVrE3J4C1b8y795IUVgSr2B/5yYN57kLmGGEwX1y69j3BVxpN0S4HzCa
	BvHIFFloaak7YhQzVpV3Qi0INii51RlSBjYbADBEBQjRNFqnZjdzHkaxoBYWRQAyhb20
	5WfyCHsTcn9HMx0WEOKy30byXR+xiJ0KLAtirT9lNjoga0xWP43E47i4tHGOSiux8/Aw
	xtrJ1xSaO1cT8vBRa457FC7O+c19tECY39CJNY5tkxMn7oiR0rKUWtCrALJ8B5p21eUE
	Xd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nH0YbneI7d8YLRIU2acvndT+kijTrW+bFhEMzDRn5UU=;
	b=A3fXFY9DHg1nDum06Pe8bHTxOa/SKKsxcnmqOkvWx1GWuUIBUU31yYs4ToKH3t8k9A
	1tSx9804EkLuhzMPWA0DG8aqkRFtLEyNDJT98PQIPGEs+KQWAIRhPyL/hH0D7/rFA/hk
	k3d9JdMJmtJS3m/IRgzFLoFhu6ZkNcTpBGrIq6M4duzDqcbwu4nApvtwZjyRnqpPCkKv
	tr4qelPyMN88zvzzqRSgUhuvCWRsgSFKHKSyyshXdg2pFqxlTeWcbqcGeDMqFDcB/F5r
	ut005vx+SSmyUasVy6gIhm8He74FC32S3mCZtCSydjUlUC0uaz8COvnwDCphxGC4zrGF
	5CSg==
X-Gm-Message-State: APjAAAUYOPQ8SsG4TTSLaYd4n/F4Q0kA44SiF7vMMfQqDqInwxdWzKE3
	FsuNBMsk06EY2vZjWeMu5PCB4/i1lJk/OLv8BXOjTg==
X-Google-Smtp-Source: APXvYqxtUU97BNRe29X6BLMbh5pIEaeXe0Zz9q/qafiWF4SGYkKO2+PNXVhgGdVstWLUk/mcHI5LlsIE8qa8wqbVUdU=
X-Received: by 2002:a24:ca05:: with SMTP id k5mr4818130itg.71.1557335121797;
	Wed, 08 May 2019 10:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB3685C976E13C7FEE91C8529C95350@AM6PR08MB3685.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3685C976E13C7FEE91C8529C95350@AM6PR08MB3685.eurprd08.prod.outlook.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 8 May 2019 18:05:11 +0100
Message-ID: <CAPoiz9yw6Ya8qzPOYkUoiGQkXSsSbAxSRC4NYOOL=5mbmo9GGQ@mail.gmail.com>
To: Rob Walton <Rob.Walton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: automated license reporting
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
X-List-Received-Date: Wed, 08 May 2019 17:05:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2019 at 8:50 PM Rob Walton <Rob.Walton@arm.com> wrote:
>
> Hi,
>
>
> We're working with OpenEmbedded/yocto in a project; we're trying to creat=
e an HTML license report for our users, leveraging the license.manifest fil=
es output from license_image.bbclass.
>
>
> However some relatively crucial information relevant to the report isn't =
provided in the manifests. The extra information I'm interested in is the c=
ontents of the HOMEPAGE and SUMMARY variables for each package/blob recorde=
d by the manifest.
>
>
> I'm proposing to submit a patch to add the following to `write_license_fi=
les`:
>
>
> -                license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LIC=
ENSE"])
> -
> +                license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICEN=
SE"])
> +                license_file.write("SUMMARY: %s\n" % pkg_dic[pkg].get("S=
UMMARY", ""))
> +                license_file.write("HOMEPAGE: %s\n\n" % pkg_dic[pkg].get=
("HOMEPAGE", ""))
>
> At the moment it isn't a problem for us if this extra information is miss=
ing for /some/ packages, as long as it is included at least once per recipe=
 (which is the case).

Sorry, but why is this a problem?  Is there some legal requirement
this fulfills, or does is this an internal standard?

> The above patch would rely on another patch to add extra output in packag=
e.bbclass::emit_pkg_data
>
>
> +        write_if_exists(sf, pkg, 'HOMEPAGE')
>
> We also have a bbclass to convert the license.manifest(s) to JSON format =
for easier machine readability, so we can automate this process in our buil=
d system. This bbclass is also potentially upstreamable.
>
> My questions are: Would members of the community object to these patches?=
 Are there any other suggestions for grabbing this extra info without submi=
tting the patches? Would anyone else in the community find this useful?

IMHO, the license file is for only the licenses of the relevant
projects.  This would muddy the waters.  Perhaps creating another file
that has all of the relevant information you desire would be better.

Thanks,
Jon

>
> Thanks,
>
>
> Rob
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

