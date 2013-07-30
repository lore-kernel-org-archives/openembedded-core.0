Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCC46B403
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6U1d7HE029196
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 18:39:07 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Jul 2013 18:39:05 -0700
Message-ID: <51F71933.7090402@windriver.com>
Date: Tue, 30 Jul 2013 09:38:59 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1375112939.git.sgw@linux.intel.com>
	<1931416.qSpeW4C5Z6@helios>
In-Reply-To: <1931416.qSpeW4C5Z6@helios>
Subject: Re: [CONSOLIDATED PULL (Part 2) (resend) 00/14] Fixed again
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
X-List-Received-Date: Tue, 30 Jul 2013 01:39:05 -0000
Content-Type: multipart/alternative;
	boundary="------------000009050101000409060106"

--------------000009050101000409060106
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2013 12:32 AM, Paul Eggleton wrote:
> On Monday 29 July 2013 08:51:01 Saul Wold wrote:
>> Clearly having a bad morning!
>>
>> This one drops the Recipe Re-names from Ema, should not have been
>> there.
>>
>> Sau!
>>
>> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
>>
>>    external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>>   
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
>> stage2
>>
>> Andrei Dinu (1):
>>    libpng : upgrade to 1.6.3
>>
>> Emilia Ciobanu (2):
>>    distrodata.bbclass: Remove whitespaces
>>    distrodata.bbclass: Include PRSPV variable in upstream version
>>      checking
>>
>> Hongxu Jia (3):
>>    util-linux: use u-a for su
>>    shadow: use u-a for su
>>    move /bin/su to /usr/bin/su to match util-linux and shadow
> Missing busybox: prefix on the latter
>   
Sorry for the missing, I have corrected this in
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-su

//Hongxu
>> Jukka Rissanen (1):
>>    ofono: Move bluetooth enablement from .bb to .inc
>>
>> Laurentiu Palcu (1):
>>    csl-versions.inc: instruct user to check local.conf
>>
>> Ming Liu (3):
>>    libpam: deny all services for the OTHER entries
> I'm not a pam expert, so I'm just assuming this is the right thing to be
> doing. It seems like it might be if you want the system to be secure by
> default, but from what I can tell it also means that every service using pam
> for authentication must explicitly provide a configuration file.
>
>>    util-linux: fix a regression
>>    util-linux: replace += with _append to EXTRA_OECONF_class-native
>>
>> Paul Eggleton (1):
>>    classes/sanity: check for suid root command evility
>>
>> Peter Seebach (1):
>>    pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0
>>
>> Saul Wold (1):
>>    bluez5: Add obex as a PACKAGECONFIG and package seperately
> Otherwise:
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> Cheers,
> Paul
>


--------------000009050101000409060106
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/30/2013 12:32 AM, Paul Eggleton
      wrote:<br>
    </div>
    <blockquote cite="mid:1931416.qSpeW4C5Z6@helios" type="cite">
      <pre wrap="">On Monday 29 July 2013 08:51:01 Saul Wold wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Clearly having a bad morning!

This one drops the Recipe Re-names from Ema, should not have been
there.

Sau!

The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:

  external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
 
<a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/">http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/</a>
stage2

Andrei Dinu (1):
  libpng : upgrade to 1.6.3

Emilia Ciobanu (2):
  distrodata.bbclass: Remove whitespaces
  distrodata.bbclass: Include PRSPV variable in upstream version
    checking

Hongxu Jia (3):
  util-linux: use u-a for su
  shadow: use u-a for su
  move /bin/su to /usr/bin/su to match util-linux and shadow
</pre>
      </blockquote>
      <pre wrap="">
Missing busybox: prefix on the latter
 
</pre>
    </blockquote>
    Sorry for the missing, I have corrected this in<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a
href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-su">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-su</a><br>
    <br>
    //Hongxu<br>
    <blockquote cite="mid:1931416.qSpeW4C5Z6@helios" type="cite">
      <blockquote type="cite">
        <pre wrap="">Jukka Rissanen (1):
  ofono: Move bluetooth enablement from .bb to .inc

Laurentiu Palcu (1):
  csl-versions.inc: instruct user to check local.conf

Ming Liu (3):
  libpam: deny all services for the OTHER entries
</pre>
      </blockquote>
      <pre wrap="">
I'm not a pam expert, so I'm just assuming this is the right thing to be 
doing. It seems like it might be if you want the system to be secure by 
default, but from what I can tell it also means that every service using pam 
for authentication must explicitly provide a configuration file.

</pre>
      <blockquote type="cite">
        <pre wrap="">  util-linux: fix a regression
  util-linux: replace += with _append to EXTRA_OECONF_class-native

Paul Eggleton (1):
  classes/sanity: check for suid root command evility

Peter Seebach (1):
  pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0

Saul Wold (1):
  bluez5: Add obex as a PACKAGECONFIG and package seperately
</pre>
      </blockquote>
      <pre wrap="">
Otherwise:
Acked-by: Paul Eggleton <a class="moz-txt-link-rfc2396E" href="mailto:paul.eggleton@linux.intel.com">&lt;paul.eggleton@linux.intel.com&gt;</a>

Cheers,
Paul

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000009050101000409060106--
