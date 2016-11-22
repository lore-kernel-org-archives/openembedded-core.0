Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD706AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:10:17 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>
References: <5c4588bd-53f6-6086-0443-faed9c0732cc@embed.me.uk>
	<CAJTo0LY4eFrus=dOy4PzbauML6iz4qzpCKrw9rp-pLCy6YiscQ@mail.gmail.com>
	<1c31ec07-55d1-3a33-fc5f-6047c940d950@embed.me.uk>
	<CAJTo0LYsnuFVtpz72y=8zGAY3+pjn6z3WoAcwwODWhrPvkhX+w@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <36f0f90f-5052-1551-1dd4-05b180e43ad7@embed.me.uk>
Date: Tue, 22 Nov 2016 16:09:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYsnuFVtpz72y=8zGAY3+pjn6z3WoAcwwODWhrPvkhX+w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: distro checking and lsb_release
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
X-List-Received-Date: Tue, 22 Nov 2016 16:10:18 -0000
Content-Type: multipart/alternative;
	boundary="------------72D478FE58743882B3EBE30E"

--------------72D478FE58743882B3EBE30E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 22/11/16 15:32, Burton, Ross wrote:
>
> On 22 November 2016 at 15:11, Jack Mitchell <ml@embed.me.uk
> <mailto:ml@embed.me.uk>>wrote:
>
>         >    distro_id = distro_data['DISTRIB_ID']
>              release = distro_data['DISTRIB_RELEASE']
>     TypeError: 'NoneType' object is not subscriptable
>
>
> You're using arch which doesn't set those fields.  There's a patch on
> the list which should be in master shortly.

Ah, OK. Installing the lsb-release package does fix this for me in the
shortrun though.

Cheers.

--------------72D478FE58743882B3EBE30E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>On 22/11/16 15:32, Burton, Ross wrote:</tt><tt><br>
    </tt>
    <blockquote
cite="mid:CAJTo0LYsnuFVtpz72y=8zGAY3+pjn6z3WoAcwwODWhrPvkhX+w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><tt><br>
          </tt>
          <div class="gmail_quote"><tt>On 22 November 2016 at 15:11,
              Jack Mitchell </tt><tt><span dir="ltr">&lt;<a
                  moz-do-not-send="true" href="mailto:ml@embed.me.uk"
                  target="_blank">ml@embed.me.uk</a>&gt;</span></tt><tt>
              wrote:</tt><tt><br>
            </tt>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><tt>   
                &gt;    distro_id = distro_data['DISTRIB_ID']</tt><tt><br>
              </tt><tt> </tt><tt>         release =
                distro_data['DISTRIB_RELEASE']</tt><tt><br>
              </tt> <tt>TypeError: 'NoneType' object is not
                subscriptable</tt><tt><br>
              </tt></blockquote>
          </div>
          <tt><br>
          </tt><tt>You're using arch which doesn't set those fields. 
            There's a patch on the list which should be in master
            shortly.</tt></div>
      </div>
    </blockquote>
    <br>
    <tt>Ah, OK. Installing the lsb-release package does fix this for me
      in the shortrun though.<br>
      <br>
      Cheers.<br>
    </tt><tt></tt>
  </body>
</html>

--------------72D478FE58743882B3EBE30E--
