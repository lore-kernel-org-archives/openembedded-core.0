Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 125397C127
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:17:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9G2HqxL014528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 19:17:52 -0700 (PDT)
Received: from [128.224.158.233] (128.224.158.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 15 Oct 2019 19:17:52 -0700
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1571129436.git.liezhi.yang@windriver.com>
	<f25dc9d8cf72566819e6bf3b55ee987ca80adb3e.1571129436.git.liezhi.yang@windriver.com>
	<03d2e12e-c62c-a1c0-a07d-10ae456da270@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4cc64631-fa7e-a87f-b076-ef7e4c666c6b@windriver.com>
Date: Wed, 16 Oct 2019 10:17:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <03d2e12e-c62c-a1c0-a07d-10ae456da270@windriver.com>
Subject: Re: [PATCH 1/1] weston: Fix PACKAGECONFIG for remoting
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
X-List-Received-Date: Wed, 16 Oct 2019 02:17:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 10/15/19 9:18 PM, Trevor Gamblin wrote:
> On 10/15/19 4:51 AM, Robert Yang wrote:
> 
>> Fix a typo: gstreamer-1.0 -> gstreamer1.0.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-graphics/wayland/weston_7.0.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb 
>> b/meta/recipes-graphics/wayland/weston_7.0.0.bb
>> index d212754..02d724a 100644
>> --- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
>> +++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
>> @@ -64,7 +64,7 @@ PACKAGECONFIG[colord] = 
>> "-Dcolor-management-colord=true,-Dcolor-management-color
>>   # Clients support
>>   PACKAGECONFIG[clients] = "-Dsimple-clients=all 
>> -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
>>   # Virtual remote output with GStreamer on DRM backend
>> -PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
>> +PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
>>   # Weston with PAM support
>>   PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
> 
> You'll need to add gstreamer1.0-plugins-base as well if it is going to 
> successfully build, i.e. the line should be
> 
> PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 
> gstreamer1.0-plugins-base"

Thanks, make sense, I will send a V2 for it.

// Robert

> 
> Otherwise, you'll run into do_package_qa errors.
> 
> 

