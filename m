Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB297135D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 15:38:29 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hn18so805891igb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AnLiIThQoBeYm2HaMhnbdoaWH2qL2jdkl96jWH/rZug=;
	b=IFIiE0wuuB2yXcgqP3LtuPxTsUkwVe2rTVvhlefM9q2f+pNiRXtffEnXeVQfAKnhJX
	hZX0JkVZV8mk1qW88Bi01Mr2z+gF+uoLv/BDJEW7COrOr3KBJ6FfIWUwbIGNYY6cbJHL
	29do17AsZBuJ1MKErh7NTF110XHW/ZG1K0S7OiGR7fPFRIRNp60t4iBH5aGQE7BLIoXi
	8UWkkzsvc01bu+SE1Iws9J5dE/YWDXza/wtAFJzodFNWgBlD4tAxrY0v9LB93wyL6OW+
	+7R7njOruTEaIjUFbbuUwM0eb3K7QfYEVqlsQcpqtjoCZawiCi8hfWShkNfOVekjJGL0
	Bz1Q==
X-Received: by 10.50.85.74 with SMTP id f10mr12834925igz.4.1410017910869; Sat,
	06 Sep 2014 08:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sat, 6 Sep 2014 08:38:00 -0700 (PDT)
In-Reply-To: <540AE4E0.3080209@pabigot.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<540AE4E0.3080209@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Sep 2014 08:38:00 -0700
Message-ID: <CAMKF1spvZe+uUBs6z4RX31T+Lax5T5gCbYzBtc=PvYKA5n_KzA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
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
X-List-Received-Date: Sat, 06 Sep 2014 15:38:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 6, 2014 at 3:41 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 09/06/2014 05:03 AM, Khem Raj wrote:
>>
>> On Fri, Sep 5, 2014 at 7:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>
>>> On Friday, September 5, 2014, Burton, Ross <ross.burton@intel.com> wrote:
>>>>
>>>> On 4 August 2014 21:16, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>>>
>>>>>> And I still get empty documents back from the OE patchwork server for
>>>>>> every
>>>>>> pwclient command I try.
>>>>>>
>>>>>> Anybody have any idea what's going wrong?
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>> Peter
>>>>>>
>>>>>> llc[40]$ /tmp/pwclient projects
>>>>>> Traceback (most recent call last):
>>>>>>    File "/tmp/pwclient", line 500, in <module>
>>>>>>      main()
>>>>>>    File "/tmp/pwclient", line 439, in main
>>>>>>      action_projects(rpc)
>>>>>>    File "/tmp/pwclient", line 213, in action_projects
>>>>>>      projects = rpc.project_list("", 0)
>>>>>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
>>>>>>      return self.__send(self.__name, args)
>>>>>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
>>>>>>      verbose=self.__verbose
>>>>>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
>>>>>>      return self.single_request(host, handler, request_body, verbose)
>>>>>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in
>>>>>> single_request
>>>>>>      return self.parse_response(response)
>>>>>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in
>>>>>> parse_response
>>>>>>      p.close()
>>>>>>    File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
>>>>>>      self._parser.Parse("", 1) # end of data
>>>>>> xml.parsers.expat.ExpatError: no element found: line 1, column 0
>>>>>
>>>>> I have same error; I am adding Khem who I know has access to the
>>>>> server and can know more about it.
>>>>
>>>> Khem - have you been able to look at this?  I was hoping to use
>>>> patchwork to merge patches from the list but obviously this is a bit
>>>> of a blocker.
>>>
>>>
>>> Ok I haven't but over this weekend I can try
>>
>> This issue should be fixed now. Please download pwclient from
>> http://patchwork.openembedded.org/pwclient/
>> once again and, it should update your .pwclientrc but there may be
>> gotchas so make sure it is of this form
>
>
> Thanks.  The new version works for me.  Note that you need to add (e.g.) -p
> oe-core to some commands to select the non-default project, and that the
> username and password can also be placed in the project sections of
> .pwclientrc to allow for different login information for different servers.
>

can you add a working .pwclientrc to wiki

http://www.openembedded.org/wiki/Patchwork

