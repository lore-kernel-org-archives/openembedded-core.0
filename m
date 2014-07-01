Return-Path: <scerveau@connected-labs.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id B8B5D610F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 08:24:18 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so6915374wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 01:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mtxp7c5SCI8aZKVyYHsS6YyXzP5b++D/folw0QVYd60=;
	b=ImjqceJn5/gPM9EGD81AofsXvC/OWj2L+Ye6LqDO5FjOdneX6RNbtqs1YX6boph74e
	be0L0NfvllQ+RBSFoekUIznuclkYTCdkLujraGTxRl4SRXKuj0Ve1D5SzxWhQEpMxLD8
	VpjWPqlz8Kh0piEcucMufdcwFPpflPjvVkTf5W7g+7nYICzSuJ8lysDg06GmadALf41K
	0ESicAExdF6YSK1T6u+L6D/TotdnRvut08eOf6VpqaHVFruzs8JejLydPqpn/V749Ius
	ViXCdDdM81RL49DBJ/+nIO5nQXY5jA5gQNC1OZit7ui38+U0FDJHzzNytQx6SZEeelwx
	E1yg==
X-Gm-Message-State: ALoCoQlK44oJuA/apEw7C/+gQRhZ+Q/tzCrX68Rmp8lSvWA368yP0tCTTg5p3sIqN3KCSFLlgEBJ
X-Received: by 10.194.119.9 with SMTP id kq9mr40586421wjb.49.1404203058992;
	Tue, 01 Jul 2014 01:24:18 -0700 (PDT)
Received: from [172.24.63.14]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id fs17sm8390362wjc.6.2014.07.01.01.24.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Jul 2014 01:24:18 -0700 (PDT)
Message-ID: <53B27026.6050207@connected-labs.com>
Date: Tue, 01 Jul 2014 10:24:06 +0200
From: Stephane Cerveau <scerveau@connected-labs.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1404138195-14158-1-git-send-email-scerveau@connected-labs.com>
	<1404165610.6362.45.camel@ted>
In-Reply-To: <1404165610.6362.45.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH] vala: should not depend on gtk+
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
X-List-Received-Date: Tue, 01 Jul 2014 08:24:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, it could be an idea.
On my side i tried with this patch but i could miss some dependency seen 
that my build was incremental. Could be better to merge the master patch.
Best regards.

Stéphane
On 07/01/2014 12:00 AM, Richard Purdie wrote:
> On Mon, 2014-06-30 at 16:23 +0200, Stéphane Cerveau wrote:
>> Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
>> ---
>>   meta/recipes-devtools/vala/vala.inc |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
>> index a8927d7..a9e5a57 100644
>> --- a/meta/recipes-devtools/vala/vala.inc
>> +++ b/meta/recipes-devtools/vala/vala.inc
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
>>   Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
>>   SECTION = "devel"
>> -DEPENDS = "glib-2.0 dbus gtk+"
>> +DEPENDS = "glib-2.0 dbus"
>>   BBCLASSEXTEND = "native"
>>   DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
>>   HOMEPAGE = "http://vala-project.org"
> Really we should probably backport:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=27c2cbbdb14d65caef1faafbfea063d6744f4e70
>
> ?
>
> Cheers,
>
> Richard
>


