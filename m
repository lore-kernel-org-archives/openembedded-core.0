Return-Path: <Gabriel.Barbu@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 33BDB65D0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 14:24:28 +0000 (UTC)
Received: from [192.168.14.77] (192.168.14.77) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.158.1;
	Thu, 17 Apr 2014 16:24:23 +0200
Message-ID: <534FE411.9080208@enea.com>
Date: Thu, 17 Apr 2014 17:24:17 +0300
From: Gabriel Barbu <gabriel.barbu@enea.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
	<2261894.lGiJmLJJOo@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2261894.lGiJmLJJOo@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Thu, 17 Apr 2014 14:24:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/17/2014 4:42 PM, Paul Eggleton wrote:
> Hi Gabriel,
>
> On Thursday 17 April 2014 11:27:16 Gabriel Barbu wrote:
>> Is there a specific mechanism to add a distro feature from an image reci=
pe?
>> DISTRO_FEATURES_append does not seem to work from an image-*.bb or from =
a
>> packagegroup-*.bb.
>
> You can't do this I'm afraid. DISTRO_FEATURES influences how components a=
re
> built, and aside from via dependencies and placing files in the sysroot, =
one
> recipe cannot influence how another is built. If you think about how the =
system
> produces package feeds and how these would be expected to be able to be
> installed from a running target system, if it were possible to set these =
kinds
> of options from the image you would have situations where you would build=
 one
> image and then build another and packages would change, possibly in ways =
that
> would not be compatible with the first image - so that wouldn't be practi=
cal.
>
>> Or, if not, what would be the best way to achieve this?
>> The need is that I have a number of images and only want to add a certai=
n
>> distro feature (ptest) to just one or two of them (some test images).
>
> You can have ptest enabled in the distro but ptest packages installed onl=
y in
> certain images. That is the only way this kind of thing can work. If enab=
ling
> the ptest in DISTRO_FEATURES is causing changes in an image where ptest i=
s not
> installed, that should be considered a bug.
>
> Cheers,
> Paul
>

Hi Paul,

Yes, I was afraid it=92s this way :)
Alright, I can settle for just not having them installed.

But what I=92m witnessing now is that having:
"ptest" in my DISTRO_FEATURES, and
no "ptest-pkgs" in IMAGE_FEATURES
results in the image having ptests installed.

And thanks to your explanation, I understand better I=92m likely looking=20
at a bug.
I will investigate closer.

Thanks,

Gabriel


