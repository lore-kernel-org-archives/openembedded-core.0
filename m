Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 911FC75D4B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 10:59:45 +0000 (UTC)
Received: from [192.168.0.201] ([37.24.103.185]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0MCtql-1ZWKXb49bf-009kja;
	Sun, 09 Aug 2015 12:59:45 +0200
Message-ID: <55C7325E.5050305@gmx.de>
Date: Sun, 09 Aug 2015 12:58:38 +0200
From: =?UTF-8?B?RG9taW5pYyBTYWNyw6k=?= <dominic.sacre@gmx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
	<1438095518-7513-3-git-send-email-dominic.sacre@gmx.de>
	<BC8B57D1-2220-435B-A2BA-6B0211E13907@gmail.com>
In-Reply-To: <BC8B57D1-2220-435B-A2BA-6B0211E13907@gmail.com>
X-Provags-ID: V03:K0:vyoQoO8JBf03VuXveurFt/Zrm8YF8pyZGchY3PX8C7fCj8eV151
	jrJKXqbTLdvPCUDW6ElvEmuVGaIg0XF0xi0q6r/PhlHKhQ2vMuowNBwEFK8zB9hGfBy+UE+
	t0Xh3XUjil6MblZZdeSD5/34WYJpxA5K83PQZ69UJOKXUQCQNWlAp/MwPWroJ0UadOqBzye
	BQQeu/cRFB9ljnbi4J6bw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:I5zu9DyDWBA=:M4OkmRpZDC7EXXZjqFIP3L
	+XVDhUxHBRv7ZjeI+RiTq800MokZas8f329v8DdZCvLr2Py24hgTYZknGPfXg6Fq0Tw2PRMEt
	2dOlcJbde8uDsDdVSAgKgiT8J/NrGcbac+jRUzyynk0uEOTW55Yq4xGsgvNcASnyq5RXJB4VS
	QwPSCC7guMnt0CSHsM628fKWoHAH7UEr+QlltAgLzE0I4dpjrLv4KNQ3rC4QVqT/P3X51sJmZ
	5v+H4xe1eaXAmFyxlRqT6bLH5lif+G3tXtfUhSwu1hMdZqcZLIa7fawWN53KkwwPO7HC0qpvg
	I8ZWKCdN/Pk9vSCt28TDKl+xBvObVKRNAOeDMNoXgeuIoXbM7OCk2BtpRSJ4oUj4upiJHrKIK
	Ni6BIaiT7g/tsyG+TdIn/EitK4aPbJ3a2KAHz4hku46cpnMnz4cBX1sXB8GxZWrQRwlIzJ4LA
	p24TWfgqUgOHLh0zwcLt/Oxa1d/TBzBMv5QPvBHANZfDox07GpE1c/GENkpMtBKJu561mvY+z
	Km6WqLUnVLCXQxn9Rd6lxpZEZnAeLtOe6E/uW9w8oqNVcja4RZTB5X8rXp8hEdLQpmBpP+7/D
	Ptidn24MiUQcu45QhjZrc+Bqe833Utqy53W3CcpIVBT+LBTGBnLaK9k417abEhYb5bWsS2oWs
	JahnkXOr5HEZKqMfalbgYrNTIlFz9L47hGbZU/qD9KtzO0drFFjum+fGaTBwHTVYh4uwb85tR
	ZldnFojV71FNQnbyuqktMsx/Q/PFXlFOngMyDQ==
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] python3: remove package python3-robotparser
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
X-List-Received-Date: Sun, 09 Aug 2015 10:59:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 2015-08-09 03:02, Khem Raj wrote:
>> On Jul 28, 2015, at 7:58 AM, Dominic Sacré <dominic.sacre@gmx.de> wrote:
>>
>> robotparser has been moved to urllib.robotparser in Python 3, and gets
>> packaged as part of python3-netclient alongside the rest of urllib.
>> This causes python3-modules to depend on an empty/missing
>> python3-robotparser package.
>>
>> robotparser.py is relatively small and has no dependencies outside
>> urllib, so it makes more sense to eliminate the python3-robotparser
>> package than to alter the manifest for python3-netclient.
>>
>> Part of the fix for [YOCTO #8048].
>>
>> Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
>> ---
>> meta/recipes-devtools/python/python-3.4-manifest.inc | 10 +++-------
>> scripts/contrib/python/generate-manifest-3.4.py      |  3 ---
>> 2 files changed, 3 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
>> index 557acdf..77f0125 100644
>> --- a/meta/recipes-devtools/python/python-3.4-manifest.inc
>> +++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
> 
> this file is auto generated. So did you regenerate it ?

The changes to scripts/contrib/python/generate-manifest-3.4.py are
included in the same patch:

>> diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
>> index 569fd3c..42c851c 100755
>> --- a/scripts/contrib/python/generate-manifest-3.4.py
>> +++ b/scripts/contrib/python/generate-manifest-3.4.py
>> @@ -343,9 +343,6 @@ if __name__ == "__main__":
>>     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re",
>>     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
>>
>> -    m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
>> -    "urllib/robotparser.*")
>> -
>>     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
>>     "subprocess.*" )

I ran the modified script to update python-3.4-manifest.inc, then
added both files to my commit. Is there something I've missed?


Dominic

