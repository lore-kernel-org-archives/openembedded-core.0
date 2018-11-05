Return-Path: <gtertych@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4534C78E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3039; q=dns/txt; s=iport;
	t=1541439576; x=1542649176;
	h=references:from:to:cc:subject:in-reply-to:date:
	message-id:mime-version;
	bh=tCvpJD3CMoP+wpkve/h6uggR3sl1g6jfSKngJ6phjNo=;
	b=VcPnNwIbmHFQDIlmqw9DrfIh3TnuKHoDedGJQGijtbH6w7y3sQ5QEdDc
	fs7rmWV7AX1pxefu8WFgZV7Jn+K2WQv9O5Xdn2ur+WpuLzVSq7EtEpGTL
	dgaKHucqbgOs1+Le2kd6dnkQ4GLm9fKzMvypBMtPxPSpERyJ63xUKBQPl w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AeAADVf+Bb/xbLJq1lGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBVAIBAQEBCwGCan8ojG2NRYkQkBcLAQEYC4RJAoNzNwoNAQM?=
	=?us-ascii?q?BAQIBAQJtHAyFOgEBAQECAQEmEQ8nCwULCxgJGgsPARgUGwYTgyKBdAUID6p?=
	=?us-ascii?q?UM4MqgQMBhW4ii2uBQT+BEYMSgUGBT4dJAoh3ljsJhm6GDYQWGIFVhQCKCwu?=
	=?us-ascii?q?MfYoXAgQGBQIUgVkigVVwFTuCbAmCKh2GfYFOhUA9MAGOIQEB?=
X-IronPort-AV: E=Sophos;i="5.54,468,1534809600"; 
   d="scan'208";a="7823759"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2018 17:39:32 +0000
Received: from think (ams3-vpn-dhcp4895.cisco.com [10.61.83.30])
	(authenticated bits=0)
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTPSA id wA5HdVj6006524
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Mon, 5 Nov 2018 17:39:32 GMT
References: <1541138869-68039-1-git-send-email-changqing.li@windriver.com>
	<20181102064101.13840.12812@do.openembedded.org>
	<f8c4a061-f2d2-9c04-1885-647f98a222ea@windriver.com>
User-agent: mu4e 1.0; emacs 25.2.1
From: Grygorii Tertychnyi <gtertych@cisco.com>
To: Changqing Li <changqing.li@windriver.com>
In-reply-to: <f8c4a061-f2d2-9c04-1885-647f98a222ea@windriver.com>
Date: Mon, 05 Nov 2018 19:39:27 +0200
Message-ID: <87a7mn2zlc.fsf@cisco.com>
MIME-Version: 1.0
X-Authenticated-User: gtertych@cisco.com
X-Outbound-SMTP-Client: 10.61.83.30, ams3-vpn-dhcp4895.cisco.com
X-Outbound-Node: aer-core-3.cisco.com
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGN1cmw6IGZpeCBmb3IgQ1ZFLTIwMTgtMTY4MzkvQ1ZFLTIwMTgtMTY4NDAvQ1ZFLTIwMTgtMTY4NDI=?=
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
X-List-Received-Date: Mon, 05 Nov 2018 17:39:34 -0000
Content-Type: text/plain; format=flowed


On Fri Nov02 2018 @ 06:48, Changqing Li 
<changqing.li@windriver.com> wrote:

> I have add CVE tag in the patch file, is this test result 
> incorrect?

My guess is it was fooled by (well, "incorrect") "CVE-YYYY-XXXX" 
lines. Even thouhg it is followed by the (correct) "CVE: 
CVE-YYYY-XXXX" in your CVE patches

 43                     # first match is lax but second strict                                                                                                                   
 44                     if 
 self.re_cve_payload_pattern.match(line):                                                                                                              
 45                         if not 
 self.re_cve_payload_tag.match(line):                                                                                                          
 46                             self.fail('Missing or incorrectly 
 formatted CVE tag in included patch file',                                                                     
 47                                       'Correct or include the 
 CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"',                                                       
 48                                       commit)                                                                                                                                

Do you really need "incorrect" lines?

> On 11/2/18 2:41 PM, Patchwork wrote:
>> == Series Details ==
>>
>> Series: curl: fix for 
>> CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/14764/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded 
>> Core. This is
>> an automated response. Several tests have been executed on the 
>> proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Patch            curl: fix for 
>> CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
>>   Issue             Missing or incorrectly formatted CVE tag in 
>>   included patch file [test_cve_tag_format]
>>    Suggested fix    Correct or include the CVE tag on cve patch 
>>    with format: "CVE: CVE-YYYY-XXXX"
>>
>>
>>
>> If you believe any of these test results are incorrect, please 
>> reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising 
>> your concerns.
>> Otherwise we would appreciate you correcting the issues and 
>> submitting a new
>> version of the patchset if applicable. Please ensure you 
>> add/increment the
>> version number when sending the new version (i.e. [PATCH] -> 
>> [PATCH v2] ->
>> [PATCH v3] -> ...).
>>
>> ---
>> Guidelines: 
>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> Test framework: 
>> http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite: 
>> http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>
>>
> -- 
> BRs
>
> Sandy(Li Changqing)


