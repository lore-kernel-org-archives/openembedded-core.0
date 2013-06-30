Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id D62D86A468
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 16:02:34 +0000 (UTC)
Received: (qmail 21432 invoked by uid 1003); 30 Jun 2013 16:02:35 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@96.240.165.115)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	30 Jun 2013 16:02:35 -0000
Message-ID: <51D0569A.7050705@balister.org>
Date: Sun, 30 Jun 2013 12:02:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Trevor Woerner <trevor.woerner@linaro.org>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CALmOhgk+NG_aqEwbtKXm0KTWGEim9z5bCpCE8sHiovsaDiTPew@mail.gmail.com>
In-Reply-To: <CALmOhgk+NG_aqEwbtKXm0KTWGEim9z5bCpCE8sHiovsaDiTPew@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Sun, 30 Jun 2013 16:02:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/30/2013 11:56 AM, Trevor Woerner wrote:
> On 27 June 2013 10:08, Mark Hatle <mark.hatle@windriver.com> wrote:
>> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>>
>> A number of vendors are providing a modified version, so checking
>> for just the version string is not enough.  We also need to check
>> if the patch for the issue has been applied.  We use a modified
>> version of the reproduced to check for the issue.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>> +
>> +        if status != 0:
>> +            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
> 
> 
> Instead of returning an error and asking the user to manually update
> their own 'make', wouldn't it be better if bitbake simply built its
> own known-to-be-working -native version instead? In this way a good,
> working version of 'make' could be installed in a potential SDK's
> sysroot as well?

Is the broken version good enough to build a working version?

Philip


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

