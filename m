Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id AC8C66059A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 03:19:33 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so8075852pad.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 20:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=c4BdKGIcj17Cv6kDT+eUQlOhJv+N62KsL8MVUf7VzT0=;
	b=Qtj2baoWVjE4u5vVK8rb6z6A2xtx4lWRU+rXA1FgoKoKtFOlyJSsYXoNdgyPopkSzL
	ruGFDWG0dkI/cixsmb1fAJzyZCL9sDI/SWA8ZuB0/20Kn9bye5XNq3PtJdlzZFLBw6fN
	Ej1m5yzR3eH2AwkNtFmJeAmMphyzSAY/P3PRbJpX/3VsZDeenZ2MlCMlE2o2ku7skvST
	HlIWUhSuhchkn/ikrdX2yJx3fiG3kZeF/PaA/NrXsMYwHGQ+aRWbdH1k1PilX7Bz/WF6
	hH4C+7lpzRclz923DDwz3e/iEAJvxTqpeHAY0SCUuZxSBZCr5uAh7r9mbThcyi8cvy70
	peOA==
X-Gm-Message-State: ALoCoQlcuuqJsDzrjUEfsUp0UNeKZZIWMOEEYidQGypGTPbYxU/kBMM4U95uAIShGTOCJm53tIU3
X-Received: by 10.68.228.106 with SMTP id sh10mr61199pbc.109.1407035974930;
	Sat, 02 Aug 2014 20:19:34 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:41f9:374f:9d0:670d?
	([2601:c:9380:601:41f9:374f:9d0:670d])
	by mx.google.com with ESMTPSA id
	nx12sm20114611pdb.81.2014.08.02.20.19.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Aug 2014 20:19:34 -0700 (PDT)
Message-ID: <53DDAA43.6040709@mvista.com>
Date: Sat, 02 Aug 2014 20:19:31 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1406899001-3870-1-git-send-email-sujith.h@gmail.com>
	<53DBA20E.8040709@windriver.com>
In-Reply-To: <53DBA20E.8040709@windriver.com>
Subject: Re: [PATCH] os-release: Adding a new recipe for operating system identification
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
X-List-Received-Date: Sun, 03 Aug 2014 03:19:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/01/2014 07:19 AM, Mark Hatle wrote:
> While not exactly the same thing, there is a similar file being
> generated when LSB is enabled.  It can be used outside of the LSB
> configuration as well.
>
> The recipe is simply 'lsb'.  It provides some basic initscript functions
> (required by the lsb) as well as the /etc/lsb-release file which is
> pretty close to the output below.
>
> I have wondered in the past if we should add a similar file to what the
> LSB or below is doing to 'base-files'.

That sound good to me. There seems to be a move in the community at 
large to support "/os-release".

         1. Announcement of /etc/os-release
            http://0pointer.de/blog/projects/os-release

         2. Common Platform Enumeration Specification
            http://cpe.mitre.org/specification/

         3. RFC3986 format
            https://tools.ietf.org/html/rfc3986


I tried the patch an it looks good.

many thanks,
Armin

>
> --Mark
>
> On 8/1/14, 8:16 AM, Sujith H wrote:
>> From: Sujith H <Sujith_Haridasan@mentor.com>
>>
>> The /etc/os-release will have the operating system identification data.
>> Tested on target with systemd enabled. Here is the sample file looks
>> in the file:
>>
>> ID=poky-ivi-systemd
>> NAME=Yocto GENIVI Baseline (Poky/meta-ivi)
>> VERSION=6.0+snapshot-20140721 (daisy)
>> VERSION_ID=6.0+snapshot-20140721
>> PRETTY_NAME=Yocto GENIVI Baseline (Poky/meta-ivi)
>> 6.0+snapshot-20140721 (daisy)
>>
>> Signed-off-by: Christopher Larson <kergoth@gmail.com>
>> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>> ---
>>   meta/recipes-core/os-release/os-release.bb | 36
>> ++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 meta/recipes-core/os-release/os-release.bb
>>
>> diff --git a/meta/recipes-core/os-release/os-release.bb
>> b/meta/recipes-core/os-release/os-release.bb
>> new file mode 100644
>> index 0000000..33e9581
>> --- /dev/null
>> +++ b/meta/recipes-core/os-release/os-release.bb
>> @@ -0,0 +1,36 @@
>> +inherit allarch
>> +
>> +SUMMARY = "Operating system identification"
>> +DESCRIPTION = "The /etc/os-release file contains operating system
>> identification data."
>> +LICENSE = "MIT"
>> +INHIBIT_DEFAULT_DEPS = "1"
>> +
>> +do_fetch[noexec] = "1"
>> +do_unpack[noexec] = "1"
>> +do_patch[noexec] = "1"
>> +do_configure[noexec] = "1"
>> +
>> +# Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
>> +#                     HOME_URL SUPPORT_URL BUG_REPORT_URL
>> +OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
>> +
>> +ID = "${DISTRO}"
>> +NAME = "${DISTRO_NAME}"
>> +VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if
>> 'DISTRO_CODENAME' in d else ''}"
>> +VERSION_ID = "${DISTRO_VERSION}"
>> +PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
>> +BUILD_ID ?= "${DATETIME}"
>> +
>> +python do_compile () {
>> +    with open(d.expand('${B}/os-release'), 'w') as f:
>> +        for field in d.getVar('OS_RELEASE_FIELDS', True).split():
>> +            value = d.getVar(field, True)
>> +            if value:
>> +                f.write('{0}={1}\n'.format(field, value))
>> +}
>> +do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
>> +
>> +do_install () {
>> +    install -d ${D}${sysconfdir}
>> +    install -m 0644 os-release ${D}${sysconfdir}/
>> +}
>>
>

