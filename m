Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EDA44780BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 23:49:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 15:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,449,1505804400"; d="scan'208,217";a="6061593"
Received: from davidsol-mobl.amr.corp.intel.com (HELO [10.252.250.52])
	([10.252.250.52])
	by orsmga003.jf.intel.com with ESMTP; 24 Nov 2017 15:49:37 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LYbuVyB_sqG4L-yTK0JwgRRaSpun01NR_-q=HaE4BiVmA@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <3257b871-dffa-9495-6eff-e4d9eb666cde@linux.intel.com>
Date: Fri, 24 Nov 2017 17:49:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYbuVyB_sqG4L-yTK0JwgRRaSpun01NR_-q=HaE4BiVmA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Fri, 24 Nov 2017 23:49:38 -0000
Content-Type: multipart/alternative;
	boundary="------------6D9AEC029CAA27AE854E88F5"
Content-Language: en-US

--------------6D9AEC029CAA27AE854E88F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Ross,


It is briefly explained:

- Sitecustomize was fixed since encoding was deprecated.




On 11/24/2017 10:57 AM, Burton, Ross wrote:
> diff --git a/meta/recipes-devtools/python/python/sitecustomize.py 
> b/meta/recipes-devtools/python/python/sitecustomize.py
>
>     index 273901898a0..4c8b5e2ba3d 100644
>     --- a/meta/recipes-devtools/python/python/sitecustomize.py
>     +++ b/meta/recipes-devtools/python/python/sitecustomize.py
>     @@ -27,19 +27,11 @@ def __enableReadlineSupport():
>          except IOError:
>              pass
>
>     -def __enableDefaultEncoding():
>     -    import sys
>     -    try:
>     -        sys.setdefaultencoding( "utf8" )
>     -    except LookupError:
>     -        pass
>     -
>      import sys
>      try:
>          import rlcompleter, readline
>      except ImportError:
>          pass
>      else:
>     -    __enableDefaultEncoding()
>          __registerExitHandler()
>          __enableReadlineSupport()
>
>
> This change isn't explained in the commit log.
>
> Ross


--------------6D9AEC029CAA27AE854E88F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Ross,</p>
    <p><br>
    </p>
    <p>It is briefly explained:</p>
    <p> - Sitecustomize was fixed since encoding was deprecated.</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/24/2017 10:57 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYbuVyB_sqG4L-yTK0JwgRRaSpun01NR_-q=HaE4BiVmA@mail.gmail.com">
      <div dir="ltr">diff --git a/meta/recipes-devtools/<wbr>python/python/sitecustomize.py
        b/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              index 273901898a0..4c8b5e2ba3d 100644<br>
              --- a/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
              +++ b/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
              @@ -27,19 +27,11 @@ def __enableReadlineSupport():<br>
                   except IOError:<br>
                       pass<br>
              <br>
              -def __enableDefaultEncoding():<br>
              -    import sys<br>
              -    try:<br>
              -        sys.setdefaultencoding( "utf8" )<br>
              -    except LookupError:<br>
              -        pass<br>
              -<br>
               import sys<br>
               try:<br>
                   import rlcompleter, readline<br>
               except ImportError:<br>
                   pass<br>
               else:<br>
              -    __enableDefaultEncoding()<br>
                   __registerExitHandler()<br>
                   __enableReadlineSupport()<br>
            </blockquote>
            <div><br>
            </div>
            <div>This change isn't explained in the commit log.</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6D9AEC029CAA27AE854E88F5--
