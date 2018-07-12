Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD277603B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:45:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6C9j4uT025964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jul 2018 02:45:04 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 12 Jul 2018 02:45:03 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1531375709.git.Qi.Chen@windriver.com>
	<ec0d3a1a70505f5eeebc8b03a8c84db285e90341.1531375710.git.Qi.Chen@windriver.com>
	<CAJTo0LapzeveOe1xZtFo5FY_kPy2KxG2XdQH2aLpLtjyWM0-1A@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <56f0204b-a22d-e508-ad94-f01aff3d0f4d@windriver.com>
Date: Thu, 12 Jul 2018 17:48:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LapzeveOe1xZtFo5FY_kPy2KxG2XdQH2aLpLtjyWM0-1A@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] systemd: change SRC_URI back to include musl patches unconditionally
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
X-List-Received-Date: Thu, 12 Jul 2018 09:45:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

OK. I separated them just for easier review.
I'll send out V4.

Best Regards,
Chen Qi

On 07/12/2018 05:31 PM, Burton, Ross wrote:
> Can you squash this, and the other fixes, into the recipe upgrade?
> Master doesn't need to see the revisions and fixes, and having commits
> which are broken is bad for bisecting.
>
> Ross
>
> On 12 July 2018 at 07:12, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_239.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
>> index 99fbfc1..ce8cc9a 100644
>> --- a/meta/recipes-core/systemd/systemd_239.bb
>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>> @@ -30,7 +30,7 @@ SRC_URI += "file://touchscreen.rules \
>>   SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>
>>   # patches made for musl are only applied on TCLIBC is musl
>> -SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' else ''}"
>> +SRC_URI += "${SRC_URI_MUSL}"
>>   SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
>>                  file://0002-don-t-use-glibc-specific-qsort_r.patch \
>>                  file://0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



