Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Mar 2017 22:37:55 UTC
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 9FC2C71E06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 22:37:55 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 05A2E1C0267
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 11:32:48 +1300 (NZDT)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <551380a5-13a5-da4c-29d1-d3436dfdda02@taitradio.com>
Date: Thu, 23 Mar 2017 11:32:47 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
Subject: Re: possible content for site.conf?
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
X-List-Received-Date: Wed, 22 Mar 2017 22:37:56 -0000
Content-Type: multipart/alternative;
	boundary="------------95CDEBDBFFF02D2E1E9E846C"

--------------95CDEBDBFFF02D2E1E9E846C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

We use it as a form of default local.conf, making it a consistent 
configuration for building our layer. By combining this with a "bb" 
wrapper script, nothing needs to be sourced, and there is no build 
preparation at all - our workflow is simply

 1. Check out our layer
 2. Type `bb thing`

The wrapper-script and site.conf handle the rest. Our site.conf contains 
the things you name, plus most of the settings from local.conf.sample, 
plus automatically-computed paths to directories:

  * OEDIR
      o The one that contains the build/ directory
  * META_OURLAYERNAME
  * SCRIPTS
  * SOURCEDIR
      o Where all the external sources get automatically checked out

Devs don't have to have a local.conf at all. The local.conf becomes a 
place to put, well, local configuration.


On 22/03/17 23:51, Robert P. J. Day wrote:

>    i'm documenting what one might *properly* put in a site.conf file,
> since i've been seeing examples of people loading it with references
> to recipes and images and so on, which is totally inappropriate.
>
>    from site.conf.sample, the obvious content is things like:
>
> * download dir
> * reference to local (in-house) source mirror
> * http proxies/fetching configuration
>
> and so on. any other things people throw into site.conf i can just add
> to a list so readers can understand what that file is truly designed
> for?
>
> rday
>


--------------95CDEBDBFFF02D2E1E9E846C
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>We use it as a form of default local.conf, making it a consistent
      configuration for building our layer. By combining this with a
      "bb" wrapper script, nothing needs to be sourced, and there is no
      build preparation at all - our workflow is simply</p>
    <ol>
      <li>Check out our layer</li>
      <li>Type `bb thing`</li>
    </ol>
    <p>The wrapper-script and site.conf handle the rest. Our site.conf
      contains the things you name, plus most of the settings from
      local.conf.sample, plus automatically-computed paths to
      directories:</p>
    <ul>
      <li>OEDIR</li>
      <ul>
        <li>The one that contains the build/ directory<br>
        </li>
      </ul>
      <li>META_OURLAYERNAME</li>
      <li>SCRIPTS</li>
      <li>SOURCEDIR</li>
      <ul>
        <li>Where all the external sources get automatically checked out</li>
      </ul>
    </ul>
    <p>Devs don't have to have a local.conf at all. The local.conf
      becomes a place to put, well, local configuration.<br>
    </p>
    <p><br>
    </p>
    <p>On 22/03/17 23:51, Robert P. J. Day wrote:
      <blockquote type="cite">
        <pre wrap="">  i'm documenting what one might *properly* put in a site.conf file,
since i've been seeing examples of people loading it with references
to recipes and images and so on, which is totally inappropriate.

  from site.conf.sample, the obvious content is things like:

* download dir
* reference to local (in-house) source mirror
* http proxies/fetching configuration

and so on. any other things people throw into site.conf i can just add
to a list so readers can understand what that file is truly designed
for?

rday

</pre>
      </blockquote>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------95CDEBDBFFF02D2E1E9E846C--
