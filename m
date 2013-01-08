Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TsaoN-0001fr-23
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:10:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2013 06:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; 
	d="scan'208,217";a="243455832"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2013 06:54:41 -0800
Message-ID: <50EC34AF.5010303@intel.com>
Date: Tue, 08 Jan 2013 17:01:03 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Tue, 08 Jan 2013 15:10:02 -0000
Content-Type: multipart/alternative;
	boundary="------------060603020707080200020005"

--------------060603020707080200020005
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/08/2013 02:57 PM, Enrico Scholz wrote:
> Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>> Enrico Scholz (1):
>>    systemd: move disable operation into prerm() script
>     http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&id=e01411c2400231a89bc76a229b38e7eb95b7cd81
>
> I am pretty sure that I added a 'Signed-off-by:' field to my patch but
> it is missing in the commit.  Other patches don't have the signed-off-by
> of the original author neither.
>
> Was this removal done on purpose?

I had to port the patch manually so I guess it got lost then. Do we want 
to have Sign-off-by from author as well?

>>    systemd: Introduce a create-volatile to create tmp directories
>     http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&id=64de9a773c1ac79d4dbcb041ed7e66c19a3cf6b7
>
> When/because the order of files is really important, they should be installed
> with the usual <number>- prefix method (e.g. '00-create-volatile.conf').
>
> Else, when e.g. /var/cache/apache is created by a 3rd part recipe, it
> requires (yet more) ugly naming tricks (e.g. naming it
> 'zz-apache-httpd.conf') to ensure the correct order and it might break
> easily when something else is changed.
>
You have a point here. Noted.

Radu

--------------060603020707080200020005
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 01/08/2013 02:57 PM, Enrico Scholz
      wrote:<br>
    </div>
    <blockquote
      cite="mid:lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de"
      type="cite">
      <pre wrap="">Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org">&lt;radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org&gt;</a>
writes:

</pre>
      <blockquote type="cite">
        <pre wrap="">Enrico Scholz (1):
  systemd: move disable operation into prerm() script
</pre>
      </blockquote>
      <pre wrap="">
   <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&amp;id=e01411c2400231a89bc76a229b38e7eb95b7cd81">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&amp;id=e01411c2400231a89bc76a229b38e7eb95b7cd81</a>

I am pretty sure that I added a 'Signed-off-by:' field to my patch but
it is missing in the commit.  Other patches don't have the signed-off-by
of the original author neither.

Was this removal done on purpose?
</pre>
    </blockquote>
    <br>
    I had to port the patch manually so I guess it got lost then. Do we
    want to have Sign-off-by from author as well?<br>
    <br>
    <blockquote
      cite="mid:lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">  systemd: Introduce a create-volatile to create tmp directories
</pre>
      </blockquote>
      <pre wrap="">
   <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&amp;id=64de9a773c1ac79d4dbcb041ed7e66c19a3cf6b7">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&amp;id=64de9a773c1ac79d4dbcb041ed7e66c19a3cf6b7</a>

When/because the order of files is really important, they should be installed
with the usual &lt;number&gt;- prefix method (e.g. '00-create-volatile.conf').

Else, when e.g. /var/cache/apache is created by a 3rd part recipe, it
requires (yet more) ugly naming tricks (e.g. naming it
'zz-apache-httpd.conf') to ensure the correct order and it might break
easily when something else is changed.

</pre>
    </blockquote>
    You have a point here. Noted.<br>
    <br>
    Radu<br>
    <font face="monospace"></font>
  </body>
</html>

--------------060603020707080200020005--
