Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 80BC579A6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:32:01 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w9ADW1aj023449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 10 Oct 2018 15:32:01 +0200
Received: from [167.87.5.162] ([167.87.5.162])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9ADW0ai029408;
	Wed, 10 Oct 2018 15:32:00 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181010081035.10735-1-pascal.bach@siemens.com>
	<222d0fe27ce0839f25a69d8f13d1f99462e15d99.camel@linuxfoundation.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <bfc30ca8-8348-2e16-453b-a8b33cd48e8c@siemens.com>
Date: Wed, 10 Oct 2018 15:32:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <222d0fe27ce0839f25a69d8f13d1f99462e15d99.camel@linuxfoundation.org>
Subject: Re: [PATCHv3 1/4] cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Wed, 10 Oct 2018 13:32:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10.10.2018 14:36, Richard Purdie wrote:
> On Wed, 2018-10-10 at 10:10 +0200, Pascal Bach wrote:
>> CMAKE_LIBRARY_PATH is intended to be set by projects.
>> CMAKE_SYSTEM_LIBRARY_PATH is better suited to be used in a toolchain
>> file.
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  meta/classes/cmake.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> I have a feeling something in this series may have caused:
>
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/42753/raw
>
> but haven't bisected to confirm it is the cmake changes yet (it is from
> something in master-next).
You are right the recipe is using cmake. I will investigate the issue.


