Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 558366E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 19:48:25 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x190so3603483vka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=TAqxkL22GDOMKuNA1ZxT1yTAXObfW8E0CIB/0Aoek6Y=;
	b=fh9EcLL1S52YNkbrxzVEhExyIPgg+PoeUsvVZ8sWe6QoimbRh6xeKHvsEcjIuqzKW4
	zlYBA11YRQtdNosqJKf1xEHby7n1bqxgifnyu4Wcar+49Llo1s4uDfklCAEQd1sYFqkI
	ap2IGqBpkmIzd7H8fK0a75B4/Yz7we7M1PesrrJhnphZMpZntlVzOxmBPZoN0kFU7RRl
	mtv5XvQvvD3DOJrSVJ9AraelgkfBa/wBxmKIjELPYuDK4+DRTb4dINiIddpHdH5DiK2/
	Fw/kV2MCAmJ0SoA7xGBSWC+33dN+I5rYxadPecbmmEFKDY7118MiQrfznAE+0Wns32cG
	oayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=TAqxkL22GDOMKuNA1ZxT1yTAXObfW8E0CIB/0Aoek6Y=;
	b=iissRF+FREYMq7rQqdlFA8ljqGQ3RM/tiVjUjl/4/R3og2e9gQ9WNjA7TTbIgUJpIF
	54z+DTwxK8IMHZt3K86jT8WiP0Cz4Q3ujEZK2wyUp3ZUSFa/LgiTMg3qNU+FO5zt1CUO
	tbZ+fSMJ3xNJtF5/QgcadKgJgRT8/8MLbrVJGc7JTLPt4Gg3kN2R2yBTeHUgh7ABpNVu
	53lbix4QVm3WmP0MMapRXZKu2YDmo9sgYzj1P1EzwcuqKsP1y5TZsk49NldJUZ7CZatZ
	n3e6v4yUS+FUH+1FCm7P+VONE3ptQgqYd78ac+iJCjm+yBVaCvTzNaIRriCfDHZlpsIN
	IU3w==
X-Gm-Message-State: AOPr4FUblTm+ktwCpX4yuvG29h03L8NIShc0A/tvCGvfS+9TDLZa5geujBaGjLU4+cZ4epGCofTp5an1NTczCQ==
MIME-Version: 1.0
X-Received: by 10.159.39.97 with SMTP id a88mr2713893uaa.133.1460490506426;
	Tue, 12 Apr 2016 12:48:26 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Tue, 12 Apr 2016 12:48:26 -0700 (PDT)
In-Reply-To: <CAJTo0La7Avjd3-LCBmE_cdqx1Nf47URDnj_iOrd9-7hM6wJWuA@mail.gmail.com>
References: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
	<1460485532-13735-3-git-send-email-danismostlikely@gmail.com>
	<CAJTo0La7Avjd3-LCBmE_cdqx1Nf47URDnj_iOrd9-7hM6wJWuA@mail.gmail.com>
Date: Tue, 12 Apr 2016 13:48:26 -0600
Message-ID: <CACS+7ZTFxKWOtWW4G07i0q8J5a9jWKmKfu_hamPLQZRwcfYXmQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] git: update to 2.8.1
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
X-List-Received-Date: Tue, 12 Apr 2016 19:48:28 -0000
Content-Type: text/plain; charset=UTF-8

Works for me. I'm not in a hurry.

On 12 April 2016 at 13:41, Burton, Ross <ross.burton@intel.com> wrote:
> Far too late for master/krogoth, this can be merged after they've branched.
>
> Ross
>
> On 12 April 2016 at 19:25, Dan McGregor <danismostlikely@gmail.com> wrote:
>>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>  meta/recipes-devtools/git/git_2.7.2.bb | 11 -----------
>>  meta/recipes-devtools/git/git_2.8.1.bb | 11 +++++++++++
>>  2 files changed, 11 insertions(+), 11 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
>>  create mode 100644 meta/recipes-devtools/git/git_2.8.1.bb
>>
>> diff --git a/meta/recipes-devtools/git/git_2.7.2.bb
>> b/meta/recipes-devtools/git/git_2.7.2.bb
>> deleted file mode 100644
>> index 3fd7151..0000000
>> --- a/meta/recipes-devtools/git/git_2.7.2.bb
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -require git.inc
>> -
>> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
>> -
>> ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> -                 "
>> -EXTRA_OEMAKE += "NO_GETTEXT=1"
>> -
>> -SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
>> -SRC_URI[tarball.sha256sum] =
>> "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
>> -SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
>> -SRC_URI[manpages.sha256sum] =
>> "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
>> diff --git a/meta/recipes-devtools/git/git_2.8.1.bb
>> b/meta/recipes-devtools/git/git_2.8.1.bb
>> new file mode 100644
>> index 0000000..8978b72
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/git_2.8.1.bb
>> @@ -0,0 +1,11 @@
>> +require git.inc
>> +
>> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
>> +
>> ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> +                 "
>> +EXTRA_OEMAKE += "NO_GETTEXT=1"
>> +
>> +SRC_URI[tarball.md5sum] = "1a12555182c1e9f781bc30a5c5f9515e"
>> +SRC_URI[tarball.sha256sum] =
>> "cfc66324179b9ed62ee02833f29d39935f4ab66874125a3ab9d5bb9055c0cb67"
>> +SRC_URI[manpages.md5sum] = "60552f15a90b9fcdc1b92b222e2d2379"
>> +SRC_URI[manpages.sha256sum] =
>> "df46de0c172049f935cc3736361b263c5ff289b77077c73053e63ae83fcf43f4"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

