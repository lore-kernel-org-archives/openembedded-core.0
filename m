Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RW9ee-00052U-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:38:37 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id E8158DFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 17:31:54 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArMcAKyr105T4zgTPGdsb2JhbAAMOKsRAQEBATeCJAEBAQEDAQEBawoRCxgJFg8JAwIBAgEVARsUBg0GAgEBiAu3f4sgBJI2giGSEw
X-IronPort-AV: E=Sophos;i="4.71,279,1320620400"; d="scan'208,217";a="6548480"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.235]) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 01 Dec 2011 17:31:54 +0100
Message-ID: <4ED7ABF9.5000109@emagii.com>
Date: Thu, 01 Dec 2011 17:31:53 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED53438.9040903@emagii.com>
	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
	<4ED77E14.1080309@balister.org>
	<878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net>
In-Reply-To: <878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 01 Dec 2011 16:38:38 -0000
Content-Type: multipart/alternative;
	boundary="------------060408020901060109080608"

--------------060408020901060109080608
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-12-01 16:37, Koen Kooi skrev:
> Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende geschreven:
>
>> On 11/29/2011 03:06 PM, Koen Kooi wrote:
>>> Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:
>>>
>>>> On 2011-11-29 16:03, Richard Purdie wrote:
>>>>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer
>>>>>> available.
>>>>>>          tzdata , same problem.
>>>>>>          The recipe is located in two places.
>>>>>>          meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
>>>>>> problem
>>>>>>          This is what the build uses.
>>>>> This is something to raise with the meta-oe maintainers. I think there
>>>>> isn't a problem in OECore.
>>>> Since we now have a large number of layers, maybe it is a good
>>>> idea to define in each layer,  how the "git send email" should behave in
>>>> by providing a better ".git/config" file in the trunk?
>>>>
>>>>
>>>> I.E:
>>>>
>>>> [sendemail]
>>>>    to = openembedded-core@lists.openembedded.org
>>>>
>>>> or
>>>> meta-angstrom/.git/config
>>>> [sendemail]
>>>>    to = angstrom-distro-devel@linuxtogo.org
>>>> [format]
>>>>    subjectprefix = "[meta-angstrom]"
>>>>
>>>>
>>>> No need to look in the README file with this.
>>> That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers
>> Even if it is not the preferred way, it would direct the discussion to
>> the appropriate list. This would reduce the number of mis-directed
>> emails to this list.
> You can't fix stupid, sadly.

Tend to disagree.
The whole purpose of OE is to make it possible for people,
stupid or not, to go off and make things which they would
not be able to do on their own.

As I see it, it is no real drawback of adding this, and at least some 
benefit.

As for not beeing the preferred way, I think that people that engage 
themselves
in a layer should adopt the preferred way.

Anyone seeing a bad layer, applicable only to a small subset of users,
interfering with their build should not be expected
to put a lof of effort into the fix, except reporting it.
Then the mailing list is probably the easiest thing to use.

If this is not there, expect them to send it to the official list.
BR
Ulf


>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Best Regards
Ulf Samuelsson
eMagii


--------------060408020901060109080608
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    2011-12-01 16:37, Koen Kooi skrev:
    <blockquote
      cite="mid:878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">On 11/29/2011 03:06 PM, Koen Kooi wrote:
</pre>
        <blockquote type="cite">
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
That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers
</pre>
        </blockquote>
        <pre wrap="">
Even if it is not the preferred way, it would direct the discussion to
the appropriate list. This would reduce the number of mis-directed
emails to this list.
</pre>
      </blockquote>
      <pre wrap="">
You can't fix stupid, sadly.
</pre>
    </blockquote>
    <br>
    Tend to disagree.<br>
    The whole purpose of OE is to make it possible for people,<br>
    stupid or not, to go off and make things which they would<br>
    not be able to do on their own.<br>
    <br>
    As I see it, it is no real drawback of adding this, and at least
    some benefit.<br>
    <br>
    As for not beeing the preferred way, I think that people that engage
    themselves<br>
    in a layer should adopt the preferred way.<br>
    <br>
    Anyone seeing a bad layer, applicable only to a small subset of
    users,<br>
    interfering with their build should not be expected<br>
    to put a lof of effort into the fix, except reporting it.<br>
    Then the mailing list is probably the easiest thing to use.<br>
    <br>
    If this is not there, expect them to send it to the official list.<br>
    BR<br>
    Ulf<br>
    <br>
    <br>
    <blockquote
      cite="mid:878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards
Ulf Samuelsson
eMagii
</pre>
  </body>
</html>

--------------060408020901060109080608--
