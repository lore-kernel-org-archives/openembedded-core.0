Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net
	(p3plsmtpa07-08.prod.phx3.secureserver.net [173.201.192.237])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDD571399
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 16:03:31 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-08.prod.phx3.secureserver.net with 
	id ns3U1o00F1mTNtu01s3VYJ; Sat, 06 Sep 2014 09:03:29 -0700
Message-ID: <540B3050.4080900@pabigot.com>
Date: Sat, 06 Sep 2014 11:03:28 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<540AE4E0.3080209@pabigot.com>
	<CAMKF1spvZe+uUBs6z4RX31T+Lax5T5gCbYzBtc=PvYKA5n_KzA@mail.gmail.com>
In-Reply-To: <CAMKF1spvZe+uUBs6z4RX31T+Lax5T5gCbYzBtc=PvYKA5n_KzA@mail.gmail.com>
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
X-List-Received-Date: Sat, 06 Sep 2014 16:03:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2014 10:38 AM, Khem Raj wrote:
> On Sat, Sep 6, 2014 at 3:41 AM, Peter A. Bigot<pab@pabigot.com>  wrote:
>> On 09/06/2014 05:03 AM, Khem Raj wrote:
>>> On Fri, Sep 5, 2014 at 7:40 AM, Khem Raj<raj.khem@gmail.com>  wrote:
>>>> On Friday, September 5, 2014, Burton, Ross<ross.burton@intel.com>  wrote:
>>>>> On 4 August 2014 21:16, Otavio Salvador<otavio@ossystems.com.br>  wrote:
>>>>>>> And I still get empty documents back from the OE patchwork server for
>>>>>>> every
>>>>>>> pwclient command I try.
>>>>>>>
>>>>>>> Anybody have any idea what's going wrong?
>>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>> Peter
>>>>>>>
>>>>>>> llc[40]$ /tmp/pwclient projects
>>>>>>> Traceback (most recent call last):
>>>>>>>     File "/tmp/pwclient", line 500, in <module>
>>>>>>>       main()
>>>>>>>     File "/tmp/pwclient", line 439, in main
>>>>>>>       action_projects(rpc)
>>>>>>>     File "/tmp/pwclient", line 213, in action_projects
>>>>>>>       projects = rpc.project_list("", 0)
>>>>>>>     File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
>>>>>>>       return self.__send(self.__name, args)
>>>>>>>     File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
>>>>>>>       verbose=self.__verbose
>>>>>>>     File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
>>>>>>>       return self.single_request(host, handler, request_body, verbose)
>>>>>>>     File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in
>>>>>>> single_request
>>>>>>>       return self.parse_response(response)
>>>>>>>     File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in
>>>>>>> parse_response
>>>>>>>       p.close()
>>>>>>>     File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
>>>>>>>       self._parser.Parse("", 1) # end of data
>>>>>>> xml.parsers.expat.ExpatError: no element found: line 1, column 0
>>>>>> I have same error; I am adding Khem who I know has access to the
>>>>>> server and can know more about it.
>>>>> Khem - have you been able to look at this?  I was hoping to use
>>>>> patchwork to merge patches from the list but obviously this is a bit
>>>>> of a blocker.
>>>> Ok I haven't but over this weekend I can try
>>> This issue should be fixed now. Please download pwclient from
>>> http://patchwork.openembedded.org/pwclient/
>>> once again and, it should update your .pwclientrc but there may be
>>> gotchas so make sure it is of this form
>> Thanks.  The new version works for me.  Note that you need to add (e.g.) -p
>> oe-core to some commands to select the non-default project, and that the
>> username and password can also be placed in the project sections of
>> .pwclientrc to allow for different login information for different servers.
>>
> can you add a working .pwclientrc to wiki
>
> http://www.openembedded.org/wiki/Patchwork

Apparently not. I don't have an account, and while trying to figure out 
how to request one got to a situation where I get 502 Bad Gateway on 
every request to www.openembedded.org.

The help output from pwclient and the comments in your example (and the 
ones downloaded from each project) cover it pretty well, though.  Just 
wanted to highlight to the current readership that the new version 
supports multiple projects in one config file. (Breaking the way I've 
been doing it for the last couple years which figured out the right 
default based on context, but hey, progress, right?)

Peter

