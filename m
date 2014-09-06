Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E573B713C4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 10:04:12 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id y20so14953983ier.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 03:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9u5WdA3XNYibSS7eFq2JFUl/tWcIkdOgS7QpbKyzODc=;
	b=EIZ5BFMpOgrL0racCKQza6BQLfRIQI3SzVylJY9tdtFucrScxekMa9ZbAApj87vz7A
	I1swmcYDD6ekvBXkIcBpEkvdoThzgqoV6lpoqQlX/xR2CpV7EXQoaghekjFNuC0TYxM5
	zJMDnCUx2lqBCB59fKlbf3QmwPAaOLJ2Z98zMFrO5yfob1QVLUwMtuYsI5sfHe61hrGp
	0YyPv/AJgb6+0Ec3UupFjFvKTPzKODPo0nIjVMpik5NGSGPVTVXK+fe51RAxpnbQJQi6
	27BW8eJ059a8kq554x90cjhH3Z/zkeZOKKm9lbU9ydm5Mz81oruCDfSk3jp4XPb696Bg
	AEZg==
X-Received: by 10.42.61.146 with SMTP id u18mr19725037ich.1.1409997853660;
	Sat, 06 Sep 2014 03:04:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sat, 6 Sep 2014 03:03:43 -0700 (PDT)
In-Reply-To: <CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Sep 2014 03:03:43 -0700
Message-ID: <CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
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
X-List-Received-Date: Sat, 06 Sep 2014 10:04:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 5, 2014 at 7:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Friday, September 5, 2014, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 4 August 2014 21:16, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> >> And I still get empty documents back from the OE patchwork server for
>> >> every
>> >> pwclient command I try.
>> >>
>> >> Anybody have any idea what's going wrong?
>> >>
>> >> Thanks.
>> >>
>> >> Peter
>> >>
>> >> llc[40]$ /tmp/pwclient projects
>> >> Traceback (most recent call last):
>> >>   File "/tmp/pwclient", line 500, in <module>
>> >>     main()
>> >>   File "/tmp/pwclient", line 439, in main
>> >>     action_projects(rpc)
>> >>   File "/tmp/pwclient", line 213, in action_projects
>> >>     projects = rpc.project_list("", 0)
>> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
>> >>     return self.__send(self.__name, args)
>> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
>> >>     verbose=self.__verbose
>> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
>> >>     return self.single_request(host, handler, request_body, verbose)
>> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
>> >>     return self.parse_response(response)
>> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in parse_response
>> >>     p.close()
>> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
>> >>     self._parser.Parse("", 1) # end of data
>> >> xml.parsers.expat.ExpatError: no element found: line 1, column 0
>> >
>> > I have same error; I am adding Khem who I know has access to the
>> > server and can know more about it.
>>
>> Khem - have you been able to look at this?  I was hoping to use
>> patchwork to merge patches from the list but obviously this is a bit
>> of a blocker.
>
>
> Ok I haven't but over this weekend I can try

This issue should be fixed now. Please download pwclient from
http://patchwork.openembedded.org/pwclient/
once again and, it should update your .pwclientrc but there may be
gotchas so make sure it is of this form

[options]
default = oe

username: <yyyy>
password: <xxxx>

[glibc]
url = http://patchwork.sourceware.org/xmlrpc/

[oe]
url = http://patchwork.openembedded.org/xmlrpc/

