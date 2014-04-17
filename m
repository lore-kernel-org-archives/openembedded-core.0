Return-Path: <Gabriel.Barbu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 65E4865D57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 15:21:17 +0000 (UTC)
Received: from [192.168.14.77] (192.168.14.77) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.158.1;
	Thu, 17 Apr 2014 17:21:16 +0200
Message-ID: <534FF16C.50207@enea.com>
Date: Thu, 17 Apr 2014 18:21:16 +0300
From: Gabriel Barbu <gabriel.barbu@enea.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
	<2112042.009cqD1bE3@peggleto-mobl5.ger.corp.intel.com>
	<534FE9D0.3090500@enea.com>
	<1766435.4H2Ncp94dv@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1766435.4H2Ncp94dv@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [192.168.14.77]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 17 Apr 2014 15:21:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/17/2014 5:52 PM, Paul Eggleton wrote:
> On Thursday 17 April 2014 17:48:48 Gabriel Barbu wrote:
>> On 4/17/2014 5:28 PM, Paul Eggleton wrote:
>>> On Thursday 17 April 2014 17:24:17 Gabriel Barbu wrote:
>>>> On 4/17/2014 4:42 PM, Paul Eggleton wrote:
>>>>> On Thursday 17 April 2014 11:27:16 Gabriel Barbu wrote:
>>>>>> Or, if not, what would be the best way to achieve this?
>>>>>> The need is that I have a number of images and only want to add a
>>>>>> certain
>>>>>> distro feature (ptest) to just one or two of them (some test images)=
.
>>>>>
>>>>> You can have ptest enabled in the distro but ptest packages installed
>>>>> only
>>>>> in certain images. That is the only way this kind of thing can work. =
If
>>>>> enabling the ptest in DISTRO_FEATURES is causing changes in an image
>>>>> where ptest is not installed, that should be considered a bug.
>>>>
>>>> Yes, I was afraid it=E2=80=99s this way :)
>>>> Alright, I can settle for just not having them installed.
>>>>
>>>> But what I=E2=80=99m witnessing now is that having:
>>>> "ptest" in my DISTRO_FEATURES, and
>>>> no "ptest-pkgs" in IMAGE_FEATURES
>>>> results in the image having ptests installed.
>>>
>>> Is that bug 5702, or something else?
>>>
>>>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5702
>>>
>>> Cheers,
>>> Paul
>>
>> Possibly more. Right now I only see:
>> ./dbus-ptest/ptest
>> ./perl/ptest
>>
>> in a custom image I have, but I will also try with a bigger image to
>> check if I get more.
>
> So the dbus-ptest one we're aware of (and the fix is on the mailing list)=
 but
> it would be interesting to know how the perl-ptest one got there.
>
> Cheers,
> Paul
>

Right, I will investigate.

Best regards,
Gabriel

