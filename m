Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-05.prod.phx3.secureserver.net
	(p3plsmtpa09-05.prod.phx3.secureserver.net [173.201.193.234])
	by mail.openembedded.org (Postfix) with ESMTP id 7738460144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 09:52:25 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-05.prod.phx3.secureserver.net with 
	id blsP1o00Q1mTNtu01lsQyw; Thu, 07 Aug 2014 02:52:26 -0700
Message-ID: <53E34C57.6010100@pabigot.com>
Date: Thu, 07 Aug 2014 04:52:23 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
References: <53C3A130.4000900@pabigot.com>	<53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 07 Aug 2014 09:52:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2014 03:16 PM, Otavio Salvador wrote:
> On Fri, Aug 1, 2014 at 10:07 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> On 07/14/2014 04:21 AM, Peter A. Bigot wrote:
>>> I'm finding attempts to use pwclient on
>>> http://patches.openembedded.org/xmlrpc/ produce an ExpatError because the
>>> returned document is always empty (per a wireshark trace of the
>>> transaction).  Can somebody confirm that the server for the command-line
>>> client is working properly?  Thanks.
>>>
>>> Peter
>>>
>> I've downloaded a fresh copy of pwclient from
>> http://patches.openembedded.org/help/pwclient/
>>
>> I've verified my .pwclientrc is exactly what the project info tells me it
>> should be:
>>
>> [base]
>> url: http://patches.openembedded.org/xmlrpc/
>> project: oe-core
>>
>> I've verified that pwclient works with other servers.
>>
>> And I still get empty documents back from the OE patchwork server for every
>> pwclient command I try.
>>
>> Anybody have any idea what's going wrong?
>>
>> Thanks.
>>
>> Peter
>>
>> llc[40]$ /tmp/pwclient projects
>> Traceback (most recent call last):
>>    File "/tmp/pwclient", line 500, in <module>
>>      main()
>>    File "/tmp/pwclient", line 439, in main
>>      action_projects(rpc)
>>    File "/tmp/pwclient", line 213, in action_projects
>>      projects = rpc.project_list("", 0)
>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
>>      return self.__send(self.__name, args)
>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
>>      verbose=self.__verbose
>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
>>      return self.single_request(host, handler, request_body, verbose)
>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
>>      return self.parse_response(response)
>>    File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in parse_response
>>      p.close()
>>    File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
>>      self._parser.Parse("", 1) # end of data
>> xml.parsers.expat.ExpatError: no element found: line 1, column 0
> I have same error; I am adding Khem who I know has access to the
> server and can know more about it.

Thanks for confirming this isn't just me.

It's a bit of a problem, since without a working pwclient I can't tell 
if there's already a patch that does what I need.  If there's a way to 
search through the browser interface I haven't figured it out.

Khem, if I can help with diagnosis please let me know.

Peter


