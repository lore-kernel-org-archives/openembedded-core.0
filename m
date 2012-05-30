Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=490fd1ba2=rich.pixley@palm.com>)
	id 1SZoDG-0004mv-GI for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 21:05:42 +0200
X-IronPort-AV: E=Sophos;i="4.75,686,1330934400"; d="scan'208,217";a="13840551"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 30 May 2012 11:55:22 -0700
Received: from fuji-land.noir.com ([10.100.2.10])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q4UItMmp003547;
	Wed, 30 May 2012 11:55:22 -0700
Message-ID: <4FC66D1A.8050906@palm.com>
Date: Wed, 30 May 2012 11:55:22 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FC6686B.20904@palm.com>
	<CAP9ODKrFYmfAzt_ASAMxunp6MS_7O63_WZuDGkm7p3z7nJttuA@mail.gmail.com>
In-Reply-To: <CAP9ODKrFYmfAzt_ASAMxunp6MS_7O63_WZuDGkm7p3z7nJttuA@mail.gmail.com>
Subject: Re: On the possibility of using upstart...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 30 May 2012 19:05:42 -0000
Content-Type: multipart/alternative;
	boundary="------------020307060206060206080700"

--------------020307060206060206080700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/12 11:44 , Otavio Salvador wrote:
> Dear Rich,
>
> On Wed, May 30, 2012 at 3:35 PM, Rich Pixley <rich.pixley@palm.com 
> <mailto:rich.pixley@palm.com>> wrote:
>
>     Has anyone considered the possibility of introducing upstart to
>     oe-core, perhaps as an alternative?
>
>     How would people feel about patches to do that?
>
>     I ask because "classic", (read, "former" and "proprietary"), WebOS
>     used upstart and we're considering whether to attempt to continue
>     to do so as we move to oe-core, or whether to attempt to convert
>     all of our components over.  Either way, we have to convert a
>     bunch of service scripts.  And if we're going to convert a bunch
>     of service scripts for oe-core components, (as distinct from
>     porting service scripts for Palm components), then it would be
>     much easier of those patches were to find their way into oe-core
>     rather than needing to be maintained separately.
>
>
> The support for Upstart would be welcome for sure however we need to 
> avoid the same mistakes we did in Systemd support; I'd say it ought to 
> start as a separate layer in meta-oe for the beggining and after it 
> has been properly polished we can evaluate the possibility to merge it 
> onto oe-core.
>
> Current systemd classes can give you a good work base.
At least in debian/ubuntu, the service scripts come with the components 
that use them.  I haven't looked deeply at oe-core in this regard, but 
wouldn't doing this in a separate layer involve a large number of 
append/overlay links to underlying components where the linkages were 
extremely fragile?

--rich

--------------020307060206060206080700
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 5/30/12 11:44 , Otavio Salvador wrote:
    <blockquote
cite="mid:CAP9ODKrFYmfAzt_ASAMxunp6MS_7O63_WZuDGkm7p3z7nJttuA@mail.gmail.com"
      type="cite">Dear Rich,<br>
      <br>
      <div class="gmail_quote">On Wed, May 30, 2012 at 3:35 PM, Rich
        Pixley <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:rich.pixley@palm.com" target="_blank">rich.pixley@palm.com</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          Has anyone considered the possibility of introducing upstart
          to oe-core, perhaps as an alternative?<br>
          <br>
          How would people feel about patches to do that?<br>
          <br>
          I ask because "classic", (read, "former" and "proprietary"),
          WebOS used upstart and we're considering whether to attempt to
          continue to do so as we move to oe-core, or whether to attempt
          to convert all of our components over. &nbsp;Either way, we have to
          convert a bunch of service scripts. &nbsp;And if we're going to
          convert a bunch of service scripts for oe-core components, (as
          distinct from porting service scripts for Palm components),
          then it would be much easier of those patches were to find
          their way into oe-core rather than needing to be maintained
          separately.<br>
        </blockquote>
        <div><br>
        </div>
        <div>The support for Upstart would be welcome for sure however
          we need to avoid the same mistakes we did in Systemd support;
          I'd say it ought to start as a separate layer in meta-oe for
          the beggining and after it has been properly polished we can
          evaluate the possibility to merge it onto oe-core.</div>
        <div><br>
        </div>
        <div>Current systemd classes can give you a good work base.<br>
        </div>
      </div>
    </blockquote>
    At least in debian/ubuntu, the service scripts come with the
    components that use them.&nbsp; I haven't looked deeply at oe-core in
    this regard, but wouldn't doing this in a separate layer involve a
    large number of append/overlay links to underlying components where
    the linkages were extremely fragile?<br>
    <br>
    --rich<br>
  </body>
</html>

--------------020307060206060206080700--
