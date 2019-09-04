Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 041767F250
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 19:25:32 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id o11so1361364qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 12:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=baqpCelgM+nPVt7v7Y+u31t2b/9+wsmyCfBhWipVcS4=;
	b=ZgxhruTVWTgTRaN8MsuOvIrVMb8DE3PoooRbIf5IWERoYz9+1HXmgRC2S8zjHd4lal
	+roDYYCjJl6ildhO9PTfVSZ7WkQtHfDttWM4f3S5ldVgyezOahDKtyRIgoN3nCMiUigX
	Zn2Z6+5ra4pmGhfRXoRvaRpwzqJMsxk886qEAfEXacYIVyj468nqCXjHB4NlLdz4Opw+
	gwpKApOgkBH2iS/CHOYc0giLcfX5XALPnigtW2rKDBhWgCrtsildOJCk5pDHoz7I1LEn
	K6O/IpGz5z8h+0WWWZSomyBBNWQzysP9WU7o71y8BUypnmxAGfvo2xJyMuoQhPZWVvFw
	/U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=baqpCelgM+nPVt7v7Y+u31t2b/9+wsmyCfBhWipVcS4=;
	b=RhnhPUlzheXA2ZMlpgscpV38T0QJZdDlvYcllJnY3ttMJX2XKwI1Co/Bp3r0dGT6mC
	NRv68SfTcS7sxcvcXqwT+kJ3+cScprVys0tGyuoaVBMyCJRGPZ0vXQbJCsm4AVv4Tpek
	LIku4uyz8CQFzKx1uDSdVQxmFdsTSHE3Lveu5vPlzlnzajhIzIhJmylUJ/vIJeOs42+V
	TdB13KzpbMRbfrceZ24r7INSjCf36vffKg53R3oNBXYxQVaZB411lLPP4RwXVIDGFZIx
	0zise24nqXWuT4jPBx5m4+vju5l+IkWEAWFzS8Mfx3v5NKIViCvp3pOY2uSM+EoDssei
	dBOA==
X-Gm-Message-State: APjAAAXMQZuSA3wsPa5DRzkXc50OfCaEXDrnSCYr342PJR6y8gFN8DD9
	M0BpI8Nj3RiyzsTetWogqPYkYn+eO+sY5CrLTKc=
X-Google-Smtp-Source: APXvYqx38pSukoSkonRNLDBDVfgMEBeVAI6ryHEY1SdQ1Gm69JroI7sRsBQ4rijk9ADLO+j7L4tUiMYapYtNWvyzjXA=
X-Received: by 2002:a37:4f97:: with SMTP id
	d145mr15962785qkb.474.1567625133538; 
	Wed, 04 Sep 2019 12:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190904184928.8414-1-raj.khem@gmail.com>
	<CANNYZj-J1YCrZaKvyH8u=aqy45wXfvSyXERvkmgCFY8C1-xZnQ@mail.gmail.com>
In-Reply-To: <CANNYZj-J1YCrZaKvyH8u=aqy45wXfvSyXERvkmgCFY8C1-xZnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 12:25:07 -0700
Message-ID: <CAMKF1sqNbTaTMKpm4+FKAWNBcoEm0GrtAiwAmJcWiOqLd=c1Bw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python3native, pythonnative: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Wed, 04 Sep 2019 19:25:33 -0000
Content-Type: text/plain; charset="UTF-8"

wait for v3 on this I am doing a build which is still not done yet.

On Wed, Sep 4, 2019 at 11:58 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Thanks, this looks good now.
>
> Alex
>
> On Wed, 4 Sep 2019 at 20:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> packages can use
>>
>> find_package(PythonInterp REQUIRED)
>> find_package(PythonLibs REQUIRED)
>>
>> while we control PYTHON pointing to native py3 the libs and include
>> directories will then point to build host version, which can result in
>> unexpected combination and if we are lucky we get errors if its quite
>> different e.g. py2 libs/includes and py3 executable
>>
>> This variable can be then used to export PYTHON_LIBRARY and
>> PYTHON_INCLUDE_DIR so that above find_packages can work correctly
>>
>> see [1] for how it happens in cmake
>>
>> LLDB uses it see [2]
>>
>> [1] https://github.com/Kitware/CMake/blob/master/Modules/FindPythonLibs.cmake
>> [2] https://github.com/llvm/llvm-project/blob/master/lldb/cmake/modules/LLDBConfig.cmake#L226
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Use PYTHON_DIR variable
>>
>>  meta/classes/python3native.bbclass | 8 ++++++++
>>  meta/classes/pythonnative.bbclass  | 8 ++++++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
>> index a3acaf61bb..768302488b 100644
>> --- a/meta/classes/python3native.bbclass
>> +++ b/meta/classes/python3native.bbclass
>> @@ -9,6 +9,14 @@ DEPENDS_append = " python3-native "
>>  export STAGING_INCDIR
>>  export STAGING_LIBDIR
>>
>> +# Packages can use
>> +# find_package(PythonInterp REQUIRED)
>> +# find_package(PythonLibs REQUIRED)
>> +# which ends up using libs/includes from build host
>> +# Therefore pre-empt that effort
>> +export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_DIR}"
>> +export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
>> +
>>  export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
>>
>>  # suppress host user's site-packages dirs.
>> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
>> index ae6600cd15..604423b80e 100644
>> --- a/meta/classes/pythonnative.bbclass
>> +++ b/meta/classes/pythonnative.bbclass
>> @@ -12,6 +12,14 @@ DEPENDS_append = " python-native "
>>  export STAGING_INCDIR
>>  export STAGING_LIBDIR
>>
>> +# Packages can use
>> +# find_package(PythonInterp REQUIRED)
>> +# find_package(PythonLibs REQUIRED)
>> +# which ends up using libs/includes from build host
>> +# Therefore pre-empt that effort
>> +export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_DIR}"
>> +export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
>> +
>>  # suppress host user's site-packages dirs.
>>  export PYTHONNOUSERSITE = "1"
>>
>> --
>> 2.23.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

