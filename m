Return-Path: <Gabriel.Barbu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5E6EE65E4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 12:38:02 +0000 (UTC)
Received: from [192.168.14.77] (192.168.14.77) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.158.1;
	Thu, 17 Apr 2014 14:38:01 +0200
Message-ID: <534FCB1D.2050000@enea.com>
Date: Thu, 17 Apr 2014 15:37:49 +0300
From: Gabriel Barbu <gabriel.barbu@enea.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Josep Puigdemont <josep.puigdemont@enea.com>
References: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
	<20140417113554.GE1852@iapetus.enea.se>
In-Reply-To: <20140417113554.GE1852@iapetus.enea.se>
X-Originating-IP: [192.168.14.77]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to add a distro feature from an image recipe?
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
X-List-Received-Date: Thu, 17 Apr 2014 12:38:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/2014 2:35 PM, Josep Puigdemont wrote:
> On Thu, Apr 17, 2014 at 11:27:16AM +0000, Gabriel Barbu wrote:
>> Hi,
>>
>>
>>
>> Is there a specific mechanism to add a distro feature from an image recipe?
>>
>> DISTRO_FEATURES_append does not seem to work from an image-*.bb or from a
>> packagegroup-*.bb.
>>
>>
>> Or, if not, what would be the best way to achieve this?
>>
>> The need is that I have a number of images and only want to add a certain
>> distro feature (ptest) to just one or two of them (some test images).
>
> Couldn't that be achieved by just adding "ptest-pkgs" to IMAGE_FEATURES in the
> image recipe? or "ptest-pkgs" to EXTRA_IMAGE_FEATURES in your local.conf?
>
> /Josep
>
>>
>>
>>
>> Thanks,
>>
>>
>>
>> Gabriel
>>
>>
>>
>

No, unfortunately not; ptest-pkgs are not sufficient for control of this 
feature. If you have ptest in DISTRO_FEATURES, the ptests are still 
being built for your image.

It would be possible to disable the feature from local.conf though, but 
I would have liked to avoid particularizing this file per image.

Thanks,

Gabriel


