Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9B64F7130F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 14:31:57 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x3so12368618qcv.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 07:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qRqQq0SrP4dmB5cK8GyLLDm2RgdonpXX1RG+0j/GoR0=;
	b=kSIr4g8n98t6pHCT3/UlGfLOBE08jnO0sP/pcYeh3KnH+49ReL9zn0+6uIsEbd7Ku3
	TiE2cFAUy6n842GO2Y7KyW2Yyuw90q0uZOWpqFbt3U4b1+hKiekO777VMEwCha0Li3Bz
	85tVXOwqe9nvFw6cbvNNhLXEa9jp8cqjiieCqJ/8bxkjeRgp+VLWJdltcxbtM9KMCW8m
	+uZXwyQtEoesvweAXNOj6vIhm+Ze4B0Kbub+rJhbHjvw/eprpweVcTuXsqpMGOjgv4k5
	8Cw9fAhZlMOAPYdvr3zNqxHs8DyGLTojRwbgLYH7VRykofGeYdu9Eq+EK+PqKdTHghOt
	zZpQ==
X-Gm-Message-State: ALoCoQnrfilgMzt4EaUQQBcpO20YGk8GR7st1A3CJ/XB8HDL3FmwJ/q50ORiXIoKADTw2CeUR2RH
X-Received: by 10.224.38.10 with SMTP id z10mr19311141qad.52.1409927518444;
	Fri, 05 Sep 2014 07:31:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 07:31:38 -0700 (PDT)
In-Reply-To: <CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 15:31:38 +0100
Message-ID: <CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 05 Sep 2014 14:32:03 -0000
Content-Type: text/plain; charset=UTF-8

On 4 August 2014 21:16, Otavio Salvador <otavio@ossystems.com.br> wrote:
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
>>   File "/tmp/pwclient", line 500, in <module>
>>     main()
>>   File "/tmp/pwclient", line 439, in main
>>     action_projects(rpc)
>>   File "/tmp/pwclient", line 213, in action_projects
>>     projects = rpc.project_list("", 0)
>>   File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
>>     return self.__send(self.__name, args)
>>   File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
>>     verbose=self.__verbose
>>   File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
>>     return self.single_request(host, handler, request_body, verbose)
>>   File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
>>     return self.parse_response(response)
>>   File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in parse_response
>>     p.close()
>>   File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
>>     self._parser.Parse("", 1) # end of data
>> xml.parsers.expat.ExpatError: no element found: line 1, column 0
>
> I have same error; I am adding Khem who I know has access to the
> server and can know more about it.

Khem - have you been able to look at this?  I was hoping to use
patchwork to merge patches from the list but obviously this is a bit
of a blocker.

Cheers,
Ross

