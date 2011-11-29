Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RVVWU-0006QK-0G
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:47:31 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id CCCC6D40A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 22:12:24 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj8aAApK1U5T4zgTPGdsb2JhbAAMN6sXAQEBATeCJAEBAQEDAQEBawoRCwQUCRYPCQMCAQIBFQEbFBMGAgEBiAm3O4seBJIzgiGSEg
X-IronPort-AV: E=Sophos;i="4.69,593,1315173600"; 
	d="scan'208,217";a="1766061080"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb4.telenor.se with ESMTP; 29 Nov 2011 22:12:24 +0100
Message-ID: <4ED54AB6.6000606@emagii.com>
Date: Tue, 29 Nov 2011 22:12:22 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED53438.9040903@emagii.com>
	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
In-Reply-To: <7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 21:47:31 -0000
Content-Type: multipart/alternative;
	boundary="------------010809040404080008040106"

--------------010809040404080008040106
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-29 21:06, Koen Kooi wrote:
> Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:
>
>> On 2011-11-29 16:03, Richard Purdie wrote:
>>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer
>>>> available.
>>>>           tzdata , same problem.
>>>>           The recipe is located in two places.
>>>>           meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
>>>> problem
>>>>           This is what the build uses.
>>> This is something to raise with the meta-oe maintainers. I think there
>>> isn't a problem in OECore.
>> Since we now have a large number of layers, maybe it is a good
>> idea to define in each layer,  how the "git send email" should behave in
>> by providing a better ".git/config" file in the trunk?
>>
>>
>> I.E:
>>
>> [sendemail]
>>     to = openembedded-core@lists.openembedded.org
>>
>> or
>> meta-angstrom/.git/config
>> [sendemail]
>>     to = angstrom-distro-devel@linuxtogo.org
>> [format]
>>     subjectprefix = "[meta-angstrom]"
>>
>>
>> No need to look in the README file with this.
> That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers
Not really.
Even if pulling is the preferred way for certain layers,
having this in the config, wouldnt hurt a pulling process.

It does makes it more likely that stuff is not sent to the wrong list.

BR
Ulf Samuelsson

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii


--------------010809040404080008040106
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On 2011-11-29 21:06, Koen Kooi wrote:
    <blockquote
      cite="mid:7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">On 2011-11-29 16:03, Richard Purdie wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">
</pre>
          <blockquote type="cite">
            <pre wrap="">2.    <a class="moz-txt-link-rfc2396E" href="ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz">"ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz"</a> is no longer
available.
         tzdata , same problem.
         The recipe is located in two places.
         meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
problem
         This is what the build uses.
</pre>
          </blockquote>
          <pre wrap="">This is something to raise with the meta-oe maintainers. I think there
isn't a problem in OECore.
</pre>
        </blockquote>
        <pre wrap="">
Since we now have a large number of layers, maybe it is a good
idea to define in each layer,  how the "git send email" should behave in
by providing a better ".git/config" file in the trunk?


I.E:

[sendemail]
   to = <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>

or
meta-angstrom/.git/config
[sendemail]
   to = <a class="moz-txt-link-abbreviated" href="mailto:angstrom-distro-devel@linuxtogo.org">angstrom-distro-devel@linuxtogo.org</a>
[format]
   subjectprefix = "[meta-angstrom]"


No need to look in the README file with this.
</pre>
      </blockquote>
      <pre wrap="">
That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers</pre>
    </blockquote>
    Not really.<br>
    Even if pulling is the preferred way for certain layers, <br>
    having this in the config, wouldnt hurt a pulling process.<br>
    <br>
    It does makes it more likely that stuff is not sent to the wrong
    list.<br>
    <br>
    BR<br>
    Ulf Samuelsson<br>
    <br>
    <blockquote
      cite="mid:7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards
Ulf Samuelsson
eMagii
</pre>
  </body>
</html>

--------------010809040404080008040106--
