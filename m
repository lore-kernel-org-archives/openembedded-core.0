Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE6B65C78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:07:14 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id v10so1784427pde.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 22:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=OrghJ9t4YCuTJx5BgOHh3BqL1NzMnD3oCwGZpbDuGU4=;
	b=HkHLFcyVZ4JDhehSq2F6bYeqK+yoskN0MwTTnWE3qWzZw6V/Dbca9U5CjnsoG4pCMO
	qd4LaY1fZSuUbT+0goBnDfy6Ot7Ayv4vao+ulJYkF0w43Eh62a2B+HVLLJzX+jOGi/TM
	vfdHhZv2VJKlxbZgIk6cMMmUU4d0tu0txMKud5dfP6obY8mr9QtjutsKRzd8EIZGHp6s
	Sxv+VPeMl7/C7ntUJjN7yoTs2fT07o7hNL0LL3rD4632mu7ilR3wuYfRNAKopxGTZ9pP
	udiiLZ2V0vCZhvW7/dlV7HN+DKs+tqeYl3v7Dg7xlw3Qbk0fY3tSjKy9APVIMdc8EGnX
	50TQ==
X-Received: by 10.66.156.168 with SMTP id wf8mr42878099pab.43.1416377235435;
	Tue, 18 Nov 2014 22:07:15 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:5d01:217d:7a14:bc70?
	([2601:c:9380:601:5d01:217d:7a14:bc70])
	by mx.google.com with ESMTPSA id ip1sm768265pbc.0.2014.11.18.22.07.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Nov 2014 22:07:14 -0800 (PST)
Message-ID: <546C3390.7060803@gmail.com>
Date: Tue, 18 Nov 2014 22:07:12 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: wenzong fan <wenzong.fan@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1416241492.git.akuster808@gmail.com>
	<e8e39d81a3e28f45867afccd48963a0289a346b6.1416241492.git.akuster808@gmail.com>
	<546BF26B.10206@windriver.com>
In-Reply-To: <546BF26B.10206@windriver.com>
Subject: Re: [PATCH 1/6] subversion: Security Advisory - subversion - CVE-2014-3528
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
X-List-Received-Date: Wed, 19 Nov 2014 06:07:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Wenzong,

I wanted to just patch 1.8.9 for dizzy since 1.8.10 included more than 
just security fixes.   Looks like my subject should have included 
[dizzy] even though the cover letter did.  I will have to be more 
careful next time.

thanks,
Armin

On 11/18/2014 05:29 PM, wenzong fan wrote:
> There's subversion 1.8.10 in master branch that has included the CVE fixes.
>
> Would you like to backport 1.8.10 from master? Or just patch 1.8.9 to
> fix this CVE?
>
> Thanks
> Wenzong
>
> On 11/19/2014 12:18 AM, Armin Kuster wrote:
>> From: Yue Tao <Yue.Tao@windriver.com>
>>
>> Apache Subversion 1.0.0 through 1.7.x before 1.7.17 and 1.8.x before
>> 1.8.10 uses an MD5 hash of the URL and authentication realm to store
>> cached credentials, which makes it easier for remote servers to obtain
>> the credentials via a crafted authentication realm.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3528
>>
>> (From OE-Core rev: e0dc0432b13f38d16f642bdadf8ebc78b7a74806)
>>
>> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../subversion/subversion-CVE-2014-3528.patch      | 29
>> ++++++++++++++++++++++
>>   .../subversion/subversion_1.6.15.bb                |  1 +
>>   .../subversion/subversion_1.8.9.bb                 |  1 +
>>   3 files changed, 31 insertions(+)
>>   create mode 100644
>> meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
>>
>>
>> diff --git
>> a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
>> b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
>>
>> new file mode 100644
>> index 0000000..23e738e
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
>>
>> @@ -0,0 +1,29 @@
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
>> +
>> +diff --git a/subversion/libsvn_subr/config_auth.c.old
>> b/subversion/libsvn_subr/config_auth.c
>> +index ff50270..c511d04 100644
>> +--- a/subversion/libsvn_subr/config_auth.c.old
>> ++++ b/subversion/libsvn_subr/config_auth.c
>> +@@ -85,6 +85,7 @@ svn_config_read_auth_data(apr_hash_t **hash,
>> +   if (kind == svn_node_file)
>> +     {
>> +       svn_stream_t *stream;
>> ++      svn_string_t *stored_realm;
>> +
>> +       SVN_ERR_W(svn_stream_open_readonly(&stream, auth_path, pool,
>> pool),
>> +                 _("Unable to open auth file for reading"));
>> +@@ -95,6 +96,12 @@ svn_config_read_auth_data(apr_hash_t **hash,
>> +                 apr_psprintf(pool, _("Error parsing '%s'"),
>> +                              svn_path_local_style(auth_path, pool)));
>> +
>> ++      stored_realm = apr_hash_get(*hash, SVN_CONFIG_REALMSTRING_KEY,
>> ++                                  APR_HASH_KEY_STRING);
>> ++
>> ++      if (!stored_realm || strcmp(stored_realm->data, realmstring)
>> != 0)
>> ++        *hash = NULL; /* Hash collision, or somebody tampering with
>> storage */
>> ++
>> +       SVN_ERR(svn_stream_close(stream));
>> +     }
>> +
>> diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
>> b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
>> index 6680ab6..b135bb7 100644
>> --- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
>> +++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
>> @@ -19,6 +19,7 @@ SRC_URI =
>> "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
>>              file://subversion-CVE-2013-1847-CVE-2013-1846.patch \
>>              file://subversion-CVE-2013-4277.patch \
>>              file://subversion-CVE-2014-3522.patch \
>> +           file://subversion-CVE-2014-3528.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
>> diff --git a/meta/recipes-devtools/subversion/subversion_1.8.9.bb
>> b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
>> index e1ab945..1ef59a0 100644
>> --- a/meta/recipes-devtools/subversion/subversion_1.8.9.bb
>> +++ b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
>> @@ -13,6 +13,7 @@ SRC_URI =
>> "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>>              file://libtool2.patch \
>>              file://disable_macos.patch \
>>              file://subversion-CVE-2014-3522.patch;striplevel=0 \
>> +           file://subversion-CVE-2014-3528.patch \
>>   "
>>   SRC_URI[md5sum] = "bd495517a760ddd764ce449a891971db"
>>   SRC_URI[sha256sum] =
>> "45d708a5c3ffbef4b2a1044c4716a053e680763743d1f7ba99d0369f6da49e33"
>>

