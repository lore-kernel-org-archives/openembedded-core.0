Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TJr6f-0002JW-IF
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 21:29:13 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so1866940ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=PjW7wcsRN7+bcZT6pWMkQBd6fqDcOX4gngqmClxheR8=;
	b=D7VS85sEUOZ4AqbiIaPauE+bXBTKwRBWEWdQ5v09R1V5zu2zyUHeIgh32vevZ1zVsu
	shNao3eIXxMziu+ZyfxO72GMGO9R3Mg1wfWUI48qApNxcgbaxX9nv+WQ9zww4h+toejx
	lttsT0F4JCqyFIyXq4bqm7WUF9GcYmTeWwB7OUVzWkJJFjcao5rbTwUN8HpHuW/NQG1E
	o1cd2/t3yBMNDu9Yp28monKNAxdYJa5x3gN8krXz6Fe+lvrxqpfO6HNs8R6H67dPwxyx
	PSbcIwomk5492ZWG9cUT8UN3SpfAeJk2FVOZ1i5pjGMDjKPtVBcy2ZUj+P8vIFB5so+w
	FfGg==
MIME-Version: 1.0
Received: by 10.42.91.75 with SMTP id o11mr5218967icm.57.1349378171642; Thu,
	04 Oct 2012 12:16:11 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 4 Oct 2012 12:16:11 -0700 (PDT)
In-Reply-To: <CALbNGRR6Zg6aDwZmFiW9WAFKBgass7c-DpADwcKiQYXLgwoLAQ@mail.gmail.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
	<CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
	<CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
	<5062AA0F.3050604@intel.com>
	<CALbNGRRT47T4RsVHSypgg0J12+0R0y1y6jPWK4GGTgZAaG_2sA@mail.gmail.com>
	<CALbNGRR6Zg6aDwZmFiW9WAFKBgass7c-DpADwcKiQYXLgwoLAQ@mail.gmail.com>
Date: Thu, 4 Oct 2012 21:16:11 +0200
Message-ID: <CALbNGRTH_ETydVMCyxduE90AvPk_nAgK6mUqgve4=Y9+fj6PGQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 0/7] Postinstall improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 19:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 4, 2012 at 1:37 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Sep 26, 2012 at 9:41 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> On Wed, Sep 26, 2012 at 9:09 AM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com> wrote:
>>>
>>>
>>> On 09/20/2012 07:12 PM, Andreas M=FCller wrote:
>>>> On Thu, Sep 20, 2012 at 5:38 PM, Andreas M=FCller
>>>> <schnitzeltony@googlemail.com> wrote:
>>>>> On Wed, Sep 19, 2012 at 5:33 PM, Laurentiu Palcu
>>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 09/19/2012 04:41 PM, Andreas M=FCller wrote:
>>>>>>> On Wed, Sep 19, 2012 at 1:49 PM, Laurentiu Palcu
>>>>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> It's been quite a long time since I sent the first version of post=
install
>>>>>>>> improvements which, after some debate, we decided it needed run-on=
ce
>>>>>>>> support of postinst scriptlets on host. This patcheset (RFC actual=
ly) adds
>>>>>>>> that.
>>>>>>>>
>>>>>>>> So, in order to achieve this goal I took advantage of
>>>>>>>> ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some po=
stinst
>>>>>>>> scriptlets is time consuming (even on host) and execute repeatedly=
,
>>>>>>>> then we can postpone the running and run the scriplet just once. T=
he idea is
>>>>>>>> to put the scriptlet in the ${WORKDIR}/intercept_scripts directory=
. When the
>>>>>>>> ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the sc=
ripts in
>>>>>>>> this directory and execute them.
>>>>>>>>
>>>>>>>> This actual patchset does the above for the gtk icon cache generat=
ion which
>>>>>>>> takes a very long time to run on target and even on some hosts.
>>>>>>>>
>>>>>>>> The people willing to give this patchset a test, are most than wel=
come. Also,
>>>>>>>> please feel free to review.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Laurentiu
>>>>>>>>
>>>>>>> Thanks for taking care. I will give it a test tonight and hope to h=
ave
>>>>>>> results tomorrow.
>>>>>> It would be great if you could give it a try and let me know your re=
sults.
>>>>>>
>>>>> I removed gtk-native append in meta-oe, build from scratch and tested
>>>>> the image. No issues so far - seems you have done a great job -
>>>>> Thanks!
>>>>>
>>>> Aargh I really would like to consider this done but I found suspicious
>>>> when browsing on the machine with the new image (hicolor- and
>>>> gnome-icon-theme installed):
>>>>
>>>> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
>>>> * /usr/share/icons/hicolor/icon-theme.cache is there but it has the
>>>> date of 01.01.2000 (have no rtc backup on the machine). I would expect
>>>> this file to have build host's date.
>>>>
>>>> So I checked the contents on the build machine in image's rootfs:
>>>>
>>>> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
>>>> * /usr/share/icons/hicolor/icon-theme.cache is there but has only
>>>> 64,5KB (the version on the machine is 2,3MB!!).
>>> Did you have any chance to debug the issue on your setup? I tried to
>>> replicate your environment but I failed. Lots of build errors, so I gav=
e
>>> up. It would have taken me more time to make your setup work than
>>> debugging the real problem.
>>>
>>> Another alternative would be for you to prepare a tarball with all the
>>> repos and configs that you use and put it somewhere where I can take it=
.
>>> It would be easier for me to directly start debugging your issue.
>>>
>> Sorry but I am occupied by other issues at the moment. Hope to find
>> time at the weekend to add some debug messages to see what's going on.
>>
> Oh it's that simple: run_intercept_scriptlets is not called here (I
> don't know what caused 'mini hicolor-icon-theme's cache)! You can
> reproduce that e.g. by enabling buildhistory.
>
> I simply replaced in image.bbclass
>
> ROOTFS_POSTPROCESS_COMMAND ?=3D "run_intercept_scriptlets"
> by
> ROOTFS_POSTPROCESS_COMMAND =3D+ "run_intercept_scriptlets;"
>
> an now see larger caches for all my icon themes. But the sizes are
> still different from those mentioned above. Will run-test tomorrow.
>
> Andreas
Hey Laurentiu,

With the minor change mentioned above I tested all my working images
without issues. Thanks for taking care and speeding up first boot.

Andreas


