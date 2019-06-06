Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 996486D548
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 21:15:13 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h20so2295099itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 14:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=h7ySTQYU3CnazDtMEN1E9nS3aFawWNICOVYoHqkJR3s=;
	b=NtrZ76w31pKYffiVZRM1/F1DHKVkME277n70MwjN7l07bnFKpaCh4ZMYH33zcRiRSq
	+Ww+rGrciccDuzKBvB3X4lXrFU+hUaUkbngETY34YzD/8n6kOb2etdlw90P46FDkMPEF
	Uo0EJuCF4JkKAr0z+jpjcxDzQ1X5ef5GCnT/lKqQDToUZsHNdFRsBfcz8jN49ILxjfHH
	xZ07VYgw5LLEEaJf4e+gmVXSErGibsp0vpiyo3/bDLgW1+EcRvF9FW4gCammXjibbTsT
	/rM3I7j4j8VIgW2kJBHU9dIy1eqd2NFqe7Fx7wIw6oYH+IzCBzAoOHdCDSemm4uQVxxB
	Fg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=h7ySTQYU3CnazDtMEN1E9nS3aFawWNICOVYoHqkJR3s=;
	b=mUmEydX0co8Gg1KvP8d+l1K8hWyWiEM3PZCKrm2pTw7H/zm8mUYnkICwU4PFKFMTe6
	BrVJHTTwFi/9++IAuXbLGivnWh2V6Y1rnnzN4TXki+oZaAwG//LYQxezZYheXgKu9q+O
	78oyIK9bTTCZn51a6E6IrAnjEzSz8AYxrxXNdQ2+nAhAdvaj/NErOmivrDUD2JZIs1od
	+vdJYofePh8NFvBzEghF9kDtXzKEGYHfKD0QGsPRfIAPuvPypaFpzlG5tOnOt87/wiDw
	euoVq4BqhnrasAhinVBHZZRzZoVdKsNINq2XQ+fjk4BwkDvQX5ASIdXo9YA4i5tKIoRk
	/mhQ==
X-Gm-Message-State: APjAAAWX6e6quIbwt/RW6kDZXEMZxyUeBuH16wWQQtGTizZ6SQw+mhe4
	7JVUCmbL0/UKhlPpGEzLGj2gDs4q
X-Google-Smtp-Source: APXvYqxfGPwYWzS97WV2Kyfnck9C5RkiWmdOeky4fre+QB6GURZNOslZ7v9823CqE4ksnaQKqELiNA==
X-Received: by 2002:a05:660c:4ca:: with SMTP id
	v10mr1757917itk.24.1559855714291; 
	Thu, 06 Jun 2019 14:15:14 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v187sm1497436ita.37.2019.06.06.14.15.13
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 14:15:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
	<CAJTo0LY8p=p=6kOxQBkrUPXi_EPTpCnAXzrp7con1q7pOxj0EA@mail.gmail.com>
	<d958f915-78aa-57b8-6f31-0d50806685f7@taitradio.com>
Message-ID: <7c3a19b6-1fe2-2117-978c-59b9bf86fec3@gmail.com>
Date: Thu, 6 Jun 2019 16:15:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d958f915-78aa-57b8-6f31-0d50806685f7@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Thu, 06 Jun 2019 21:15:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

FWIW: I've fixed a few upstream recipes that were doing this to use the 
__attribute__((fallthrough)) instead of a comment.

Anyway, usually the correct fix is to add the package to 
ICECC_SYSTEM_PACKAGE_BL in icecc.bbclass; it is maybe not ideal but 
ICECC_DISABLED is the user control for enabling and disabling icecream 
globally, not a per-recipe flag.

The current blacklist is woefully outdated, I really need to get around 
to updating it

On 6/6/19 4:03 PM, Douglas Royds via Openembedded-core wrote:
> I struggled to find a solution that would work in the -native case, as 
> we need to support gcc as old as 5.4 (Ubuntu 16.04).
>
> The problem is somewhat specific to json-c, as -Werror is hard-coded 
> into configure.ac in this package.
>
>
> On 6/06/19 9:45 PM, Burton, Ross wrote:
>
>> Considering the pain that the gcc upgrade introducing that warning
>> caused I'll be *very* surprised if this problem is limited to json-c.
>> Could the icecc class forcibly disable that warning instead?
>>
>> Ross
>>
>> On Thu, 6 Jun 2019 at 03:06, Douglas Royds via Openembedded-core
>> <openembedded-core@lists.openembedded.org> wrote:
>>> icecc preprocesses source files locally before shipping them off to 
>>> be compiled
>>> on remote hosts. This preprocessing removes comments, including /* 
>>> fallthrough */
>>> comments in switch statements that normally prevent the 
>>> implicit-fallthrough
>>> warning.
>>>
>>> Rather than turning off -Werror by patching configure.ac, it is 
>>> simpler to
>>> disable icecc completely for json-c. There are very few source files 
>>> to compile,
>>> so the compilation is quick even without icecc.
>>>
>>> See https://github.com/icecc/icecream/issues/419
>>>
>>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>>> ---
>>>   meta/recipes-devtools/json-c/json-c_0.13.1.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb 
>>> b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>>> index 5b10e68297..8d2a20352d 100644
>>> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>>> +++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>>> @@ -21,6 +21,7 @@ RPROVIDES_${PN} = "libjson"
>>>   inherit autotools
>>>
>>>   EXTRA_OECONF = "--enable-rdrand"
>>> +ICECC_DISABLED = "1"
>>>
>>>   do_configure_prepend() {
>>>       # Clean up autoconf cruft that should not be in the tarball
>>> -- 
>>> 2.17.1
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

