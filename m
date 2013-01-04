Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TrAwC-00083x-K1
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 18:20:09 +0100
Received: (qmail 3728 invoked by uid 1003); 4 Jan 2013 17:05:02 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Jan 2013 17:05:02 -0000
Message-ID: <50E70BBE.1000607@balister.org>
Date: Fri, 04 Jan 2013 12:05:02 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <50E70742.6060201@balister.org>
	<CAF6bG8d=147QWj7C3nzXdbFkenUF4b7EefnNTSXFBB15W8nySw@mail.gmail.com>
In-Reply-To: <CAF6bG8d=147QWj7C3nzXdbFkenUF4b7EefnNTSXFBB15W8nySw@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with SRC_URI in .inc file and checksum in bb file
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
X-List-Received-Date: Fri, 04 Jan 2013 17:20:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2013 11:59 AM, Marko Lindqvist wrote:
> On 4 January 2013 18:45, Philip Balister <philip@balister.org> wrote:
>>
>> I am on the process of updating the fftw recipes to the most recent
>> version. Along the way I noticed it looks like the checksum test is
>> being ignored. The only way I can get it to fail is to remove all the
>> checksum entries from the bb files.
> 
>  I've got this kind of problems when I have made several iterations of
> the recipe update. In my case the explanation has always been that
> first test already downloaded the file, so no matter what I do to
> checksums after that, there's no download + checksum check on later
> tests.
>  Remove file and <file>.done from download, + 'bitbake <recipe> -c clean'

I uderstand that, but the other problem is even with a new download, the
checksum check is ignored if there are checksum entries in more than one
bb file.

Philip


